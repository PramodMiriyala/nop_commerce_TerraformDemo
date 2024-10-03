resource "aws_security_group" "base" {
  name        = var.web_sg_info.name
  description = var.web_sg_info.description
  vpc_id      = var.web_sg_info.vpc_id
  tags        = var.web_sg_info.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_22_5000" {
  for_each          = { for idx, security_group in var.web_sg_ingress_rule_info : idx => security_group }
  security_group_id = each.value.security_group_id
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = var.web_sg_egress_rule_info.security_group_id
  cidr_ipv4         = var.web_sg_egress_rule_info.cidr_ipv4
  ip_protocol       = var.web_sg_egress_rule_info.ip_protocol
}
