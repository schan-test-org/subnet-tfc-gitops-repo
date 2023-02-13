############################# public_subnets : resource ###################################
module "public_subnet" {
  source = "./modules/public-subnets"

  project = var.project
  env     = var.env
  region  = var.aws_region
  vpc_id = var.vpc_id
  igw_id = var.igw_id

  subnet_name        = var.public_subnets.subnet_name
  subnet_list        = var.public_subnets.subnet_list
  availability_zones = var.availability_zones

  common_tags = local.common_tags
  subnet_tags = {
    # Load Balancer/Ingress Controller에서 Subnet 자동 검색
    "kubernetes.io/role/elb" = 1
    # Cluster Autoscaler
    "k8s.io/cluster-autoscaler/enabled" = true
  }
}
############################# public_subnets : resource ####################################

output "public_subnet_ids" {
  value = module.public_subnet.subnet_ids
}
