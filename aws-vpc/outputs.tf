output "vpc_id" {
  value = aws_vpc.base.id
}
output "vpc_cidr" {
  value = aws_vpc.base.cidr_block
}
output "pub_subnet_id" {
  value = [for subnet in aws_subnet.pub : subnet.id]
}
output "pub_subnet_cidr" {
  value = [for subnet in aws_subnet.pub : subnet.cidr_block]
}
output "pub_subnet_tags" {
  value = { for idx, subnet in aws_subnet.pub : idx => subnet.tags }
}
output "pvt_subnet_id" {
  description = "subnet id's"
  value       = [for subnet in aws_subnet.pvt : subnet.id]
}
output "pvt_subnet_cidr" {
  value = [for subnet in aws_subnet.pvt : subnet.cidr_block]
}
output "pvt_subnet_tags" {
  value = { for idx, subnet in aws_subnet.pvt : idx => subnet.tags }
}
output "gateway_id" {
  value = aws_internet_gateway.base.id
}
output "pub_rt_id" {
  value = aws_route_table.pub_rt.id
}
output "pvt_rt_id" {
  value = aws_route_table.pvt_rt.id
}
