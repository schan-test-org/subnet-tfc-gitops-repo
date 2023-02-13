############################################
# version of terraform and providers
############################################
terraform {
  cloud {
    organization = "schan-test"

    workspaces {}
  }
}

############################################
# AWS Provider Configuration
############################################
provider "aws" {
  region  = var.aws_region
  ignore_tags {
    key_prefixes = ["kubernetes.io", "k8s.io"]
  }
}