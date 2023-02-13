resource "aws_subnet" "private" {
  count = length(var.subnet_list)

  vpc_id = var.vpc_id
  cidr_block = var.subnet_list[count.index].subnet_cidr
  availability_zone = var.subnet_list[count.index].availability_zone

  tags = merge (
    var.common_tags,
    var.subnet_tags,
    tomap( {"Name" = format("%s-%s/private-subnet-%s",
                            var.env,local.subnet_name,
                            var.subnet_list[count.index].short_availability_zone) 
    })
  )

  lifecycle {
    ignore_changes = [tags]
  }
}

output "subnet_ids" {
  value = aws_subnet.private.*.id
}
