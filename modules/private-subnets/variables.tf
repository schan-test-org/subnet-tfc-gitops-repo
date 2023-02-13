variable "project" {
  type        = string
  default     = ""
  description = "project code which used to compose the resource name"
}

variable "env" {
  type        = string
  default     = ""
  description = "environment: dev, stg, qa, prod "
}

variable "region" {
  type        = string
  default     = ""
  description = "aws region to build network infrastructure"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id"
}

variable "subnet_name" {
  type        = string
  default     = ""
  description = "subnet name"
}

variable "availability_zones" {
  type        = list
  default     = []
  description = "availability zones"
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
}

variable "nat_gateway_list" {
  type   = list
  default = []
}

variable "subnet_list" {
  type = list
  default = []
  description = "variable to create private subnet"
}

variable "common_tags" {
  # type = map
  # default     = {}
  # description = "A map of tags to add to all resources"
}

variable "subnet_tags" {
  # type = map
  # default = {}
}

variable "az_short_code" {
    default = {
        "ap-northeast-2a" = "apne2a"
        "ap-northeast-2b" = "apne2b"
        "ap-northeast-2c" = "apne2c"
        "ap-northeast-2d" = "apne2d"
    }
}