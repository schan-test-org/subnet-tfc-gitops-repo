resource "aws_route_table" "private" {
  count = var.single_nat_gateway ? 1 : 0
  # count = var.single_nat_gateway ? 1 : length(var.availability_zones)
  
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_list[count.index].id
  }

	tags = merge (
    var.common_tags,
    tomap({ "Name" = format("%s/private-%s",var.env,local.subnet_name) })
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.subnet_list)
	
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = element(
    aws_route_table.private.*.id,
    var.single_nat_gateway ? 0 : count.index
  )
}

