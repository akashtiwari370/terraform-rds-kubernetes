resource "kubernetes_deployment" "WpApp" {
  metadata {
    name = "mypod1"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        App = "wordpress"
      }

    }

    template {
      metadata {
        labels = {
          App = "wordpress"
        }
      }
      spec {
        container {
          image = "wordpress:4.8-apache"
          name  = "wppod"
        }
      }
    }
  }
}

##################################

resource "kubernetes_service" "example" {
  metadata {
    name = "myservice1"
  }
  spec {
    selector = {
      App = "wordpress"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}


##################################


