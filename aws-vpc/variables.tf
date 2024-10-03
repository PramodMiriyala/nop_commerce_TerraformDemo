variable "vpc_info" {
  type = object({
    cidr_block = string
    enable_dns_support = bool
    tags = map(string)
  })
}
variable "igw" {
  type = object({
    vpc_id = string
    tags = map(string) 
  })
}
variable "pub_sub_info" {
    type = list(object({
      cidr_block = string
      availability_zone = string
      vpc_id = string
      tags = map(string)
    }))
}
variable "pvt_sub_info" {
    type = list(object({
      cidr_block = string
      availability_zone = string
      vpc_id = string
      tags = map(string)
    }))
}
variable "pub_rt_info" {
  type = object({
    vpc_id = string
    tags = map(string)
  })
}
variable "pub_route_info" {
  type = object({
    route_table_id = string
    destination_cidr_block = string
    gateway_id = string
  })
}
variable "pub_ass_info" {
  type = object({
    subnet_id = list(string)
    gateway_id = string
    route_table_id = string
  })
}
variable "pvt_rt_info" {
  type = object({
    vpc_id = string
    tags = map(string)
  })
}
variable "pvt_ass_info" {
  type = object({
    subnet_id = list(string)
    route_table_id = string
  })
}