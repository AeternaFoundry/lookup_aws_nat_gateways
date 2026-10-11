data "aws_nat_gateways" "nat_gateways_lookup" {
  for_each = var.nat_gateways_lookup

  region = each.value.region
  tags   = each.value.tags
  vpc_id = each.value.vpc_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

