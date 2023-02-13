############################# resource : nat_gw  #######################################
resource "aws_eip" "public" {
  count = var.single_nat_gateway ? 1 : 0
  # count = var.single_nat_gateway ? 1 : length(var.availability_zones)
  vpc = true
  # tags  = merge(local.common_tags, { "Name" = format("%s-%s-nat-eip", var.env, var.az_short_code[var.availability_zones[count.index]]) })
  tags = merge(local.common_tags, { "Name" = format("%s/NAT-EIP-%s", var.env, var.az_short_code[var.availability_zones[count.index]]) })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "public" {
  count = var.enable_nat_gateway ? 1 : 0
  # count = var.single_nat_gateway ? 1 : length(var.availability_zones)

  allocation_id = aws_eip.public[count.index].id
  subnet_id     = module.public_subnet.subnet_ids[count.index]

  # tags = merge(local.common_tags, { "Name" = format("%s-%s-nat-gateway", var.env, var.az_short_code[var.availability_zones[count.index]]) })
  tags = merge(local.common_tags, { "Name" = format("%s/NAT-Gateway-%s", var.env, var.az_short_code[var.availability_zones[count.index]]) })

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_eip.public]
}
############################# output : nat_gw  #######################################

output "nat_gateway_ids" {
  value = aws_nat_gateway.public.*.id
}

############################# resource : nat_route  #######################################

resource "aws_route_table_association" "prv_existed" {
  count          = try(var.prv_route_table_id, "") == "" ? 0 : 1
  subnet_id      = module.eks_private_subnets[count.index].subnet_ids
  route_table_id = var.prv_route_table_id
  depends_on     = [module.eks_private_subnets]
}

resource "aws_route_table_association" "pub_existed" {
  count          = try(var.pub_route_table_id, "") == "" ? 0 : 1
  subnet_id      = module.public_subnet[count.index].subnet_ids
  route_table_id = var.pub_route_table_id
  depends_on     = [module.public_subnet]
}