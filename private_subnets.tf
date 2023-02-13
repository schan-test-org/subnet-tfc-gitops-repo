############################# private_subnets : local ######################################
############################# private_subnets : resource ######################################

module "eks_private_subnets" {
  source = "./modules/private-subnets"

  project = var.project
  env     = var.env
  region  = var.aws_region
  vpc_id  = var.vpc_id

  single_nat_gateway = var.single_nat_gateway
  availability_zones = var.availability_zones
  nat_gateway_list   = aws_nat_gateway.public

  subnet_name = var.private_subnets.subnet_name
  subnet_list = var.private_subnets.subnet_list

  common_tags = local.common_tags
  subnet_tags = {
    "kubernetes.io/role/internal_elb"   = 1
    "k8s.io/cluster-autoscaler/enabled" = true
  }
}

# module "db_private_subnets" {
#   source = "./modules/private-subnets"

#   project     = var.project
#   env         = var.env
#   region      = var.region
#   vpc_id      = local.vpc_id

#   single_nat_gateway = var.single_nat_gateway
#   nat_gateway_list   = aws_nat_gateway.public
#   availability_zones = var.availability_zones

#   subnet_name = var.db_private_subnets.subnet_name
#   subnet_list = var.db_private_subnets.subnet_list

#   common_tags = local.common_tags
#   subnet_tags = { 
#     "kubernetes.io/role/internal_elb"                     = 1
#     "k8s.io/cluster-autoscaler/enabled"                   = true
#   }
# }
############################# private_subnets : output ######################################

output "eks_private_subnet_ids" {
  value = module.eks_private_subnets.subnet_ids
}
