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

variable "igw_id" {
  type        = string
  default     = ""
  description = "internet gateway id"
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

variable "subnet_list" {
	type = list(object({
				availability_zone       = string
				short_availability_zone = string
				subnet_cidr             = string
				})
	)
  
  default = []
  description = "variable to create public subnet"
}

variable "common_tags" {

}

variable "subnet_tags" {

}
