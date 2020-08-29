provider "kubernetes" {
  config_context_cluster = "minikube"
}

###############################

provider "aws" {
  region  = "ap-south-1"
  profile = "eks"
}

################################

module "kube" {
  source = "./kubernetes"
}

module "rds" {
  source = "./rds"
}
