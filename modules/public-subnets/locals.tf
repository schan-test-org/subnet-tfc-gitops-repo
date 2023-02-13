locals {
	subnet_name = var.subnet_name == "" ? random_string.random.result : var.subnet_name
}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}
