resource "aws_route_table" "public" {
	vpc_id = var.vpc_id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = var.igw_id
	}

	tags = merge (
    var.common_tags,
    tomap({ "Name" = format("%s/public-%s",var.env,local.subnet_name) })
  )
}

# resource "aws_route" "public" {
# 	route_table_id = aws_route_table.public.id
# 	destination_cidr_block = "0.0.0.0/0"
# 	gateway_id = var.igw_id

# 	timeouts {
#     create = "5m"
#   }
# }

resource "aws_route_table_association" "public" {
	count = length(var.subnet_list)

	subnet_id      = aws_subnet.public[count.index].id
	route_table_id = aws_route_table.public.id
}
