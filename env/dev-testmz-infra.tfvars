########################################
# Common
########################################
project     = "dev-eks-prj"
aws_region  = "ap-northeast-2"

default_tags = {
  dept  = "DEVOPS/TERRAFORM-CLOUD-GITOPS-TESTING"
}

########################################
# wsk setting
########################################
env = "dev"

########################################
# VPC & IGW
########################################
vpc_id = "vpc-0e8acf616f7d0dd34"
igw_id = "igw-009bcbb89bdd4dff7"

########################################
# conditions
########################################
enable_nat_gateway = true
single_nat_gateway = true

################################################
# Subnets Variables
################################################

availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]

public_subnets = {
  subnet_name = "eks-pub"
  subnet_list = [{
    availability_zone       = "ap-northeast-2a"
    short_availability_zone = "apne-2a"
    subnet_cidr             = "10.30.0.0/21"
    }, {
    availability_zone       = "ap-northeast-2c"
    short_availability_zone = "apne-2c"
    subnet_cidr             = "10.30.8.0/21"
  }]
}

private_subnets = {
  subnet_name = "eks-priv"
  subnet_list = [{
    availability_zone       = "ap-northeast-2a"
    short_availability_zone = "apne-2a"
    subnet_cidr             = "10.30.16.0/20"
    }, {
    availability_zone       = "ap-northeast-2c"
    short_availability_zone = "apne-2c"
    subnet_cidr             = "10.30.32.0/20"
  }]
}

# db_private_subnets = {
# 	subnet_name = "db-priv"
# 	subnet_list = [{
# 		availability_zone = "ap-northeast-2a"
# 		short_availability_zone = "apne-2a"
# 		subnet_cidr = "10.0.151.0/24"
# 	}, {
# 		availability_zone = "ap-northeast-2c"
# 		short_availability_zone = "apne-2c"
# 		subnet_cidr = "10.0.152.0/24"
# 	}]
# }


# vpc_public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
# vpc_private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
# vpc_database_subnets   = ["10.0.151.0/24", "10.0.152.0/24"]

# vpc_create_database_subnet_group       = true
# vpc_create_database_subnet_route_table = true

