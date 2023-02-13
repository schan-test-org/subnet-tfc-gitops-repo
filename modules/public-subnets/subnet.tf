resource "aws_subnet" "public" {
  count = length(var.subnet_list)

  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_list[count.index].subnet_cidr
  availability_zone = var.subnet_list[count.index].availability_zone

  tags = merge (
    var.common_tags,
    var.subnet_tags,
    # tomap({ "Name" = format("%s-%s-%s-%s-public-subnet",
    #                         var.project,
    #                         var.env,
    #                         var.subnet_list[count.index].short_availability_zone,
    #                         local.subnet_name)
    # })
    tomap({ "Name" = format("%s-%s/public-subnet-%s",
                            var.env,local.subnet_name,
                            var.subnet_list[count.index].short_availability_zone)
    })
  )

  lifecycle {
    ignore_changes = [tags]
  }
}

output "subnet_ids" {
  value = aws_subnet.public.*.id
}
