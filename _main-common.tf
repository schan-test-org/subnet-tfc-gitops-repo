############################# main : local #######################################
locals {
  common_tags = merge(var.default_tags, {
    "region"  = var.aws_region
    "project" = var.project
    "env"     = var.env
    "managed" = "terraform"

  })
}

############################# ############### #######################################

