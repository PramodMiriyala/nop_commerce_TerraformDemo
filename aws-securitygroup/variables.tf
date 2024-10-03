variable "web_sg_info" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    tags        = map(string)
  })
}
variable "web_sg_ingress_rule_info" {
  type = list(object({
    security_group_id = string
    cidr_ipv4         = string
    from_port         = number
    ip_protocol       = string
    to_port           = number
  }))
}
variable "web_sg_egress_rule_info" {
  type = object({
    security_group_id = string
    cidr_ipv4         = string
    ip_protocol       = string
  })
}
