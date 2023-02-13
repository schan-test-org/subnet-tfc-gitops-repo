############################# main : var #######################################
variable "env" { type = string }
variable "aws_profile" { type = string }
variable "aws_region" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

# variable "suffixnum" { type = number }

############################# subnets : var #######################################
variable "public_subnets" {}
variable "private_subnets" {}
# variable "db_private_subnets" { }
variable "prv_route_table_id" { default = "" }
variable "pub_route_table_id" { default = "" }

############################# nat_route : var #####################################
variable "vpc_id" { type = string }
variable "igw_id" { type = string }
variable "single_nat_gateway" { type = bool }
variable "enable_nat_gateway" { type = bool }

variable "availability_zones" { type = list(any) }

variable "region_short_code" {
  default = {
    "ap-northeast-1" = "apne1" //  Asia Pacific (Tokyo)
    "ap-northeast-2" = "apne2" //  Asia Pacific (Seoul)
    "ap-northeast-3" = "apne3" //  Asia Pacific (Osaka)
    "ap-southeast-1" = "apse1" //  Asia Pacific (Singapore)
  }
}

variable "az_short_code" {
  default = {
    "ap-northeast-2a" = "apne2a"
    "ap-northeast-2b" = "apne2b"
    "ap-northeast-2c" = "apne2c"
    "ap-northeast-2d" = "apne2d"
  }
}

