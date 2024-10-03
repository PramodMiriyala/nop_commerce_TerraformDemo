resource "aws_vpc" "base" {
  cidr_block         = var.vpc_info.cidr_block
  enable_dns_support = var.vpc_info.enable_dns_support
  tags               = var.vpc_info.tags
}
resource "aws_internet_gateway" "base" {
  vpc_id = var.igw.vpc_id
  tags   = var.igw.tags
}
resource "aws_subnet" "pub" {
  for_each          = { for idx, subnet in var.pub_sub_info : idx => subnet }
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  vpc_id            = each.value.vpc_id
  tags              = each.value.tags
}
resource "aws_subnet" "pvt" {
  for_each          = { for idx, subnet in var.pvt_sub_info : idx => subnet }
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  vpc_id            = each.value.vpc_id
  tags              = each.value.tags
}
resource "aws_route_table" "pub_rt" {
  vpc_id = var.pub_rt_info.vpc_id
  tags   = var.pub_rt_info.tags
}
resource "aws_route" "pub_route" {
  route_table_id         = var.pub_route_info.route_table_id
  destination_cidr_block = var.pub_route_info.destination_cidr_block
  gateway_id             = var.pub_route_info.gateway_id
}
resource "aws_route_table_association" "pub_ass" {
  for_each       = { for idx, subnet in var.pub_ass_info.subnet_id : idx => subnet }
  subnet_id      = each.value
  gateway_id     = var.pub_ass_info.gateway_id
  route_table_id = var.pub_ass_info.route_table_id
}
resource "aws_route_table" "pvt_rt" {
  vpc_id = var.pvt_rt_info.vpc_id
  tags   = var.pvt_rt_info.tags
}
resource "aws_route_table_association" "pvt_ass" {
  for_each       = { for idx, subnet in var.pvt_ass_info.subnet_id : idx => subnet }
  subnet_id      = each.value
  route_table_id = var.pvt_ass_info.route_table_id
}
