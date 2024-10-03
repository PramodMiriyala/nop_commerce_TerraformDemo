module "vpc" {
  source = "../aws-vpc"
  vpc_info = {
    cidr_block         = "10.0.0.0/16"
    enable_dns_support = true
    tags = {
      Name = "nop_vpc"
    }
  }
  igw = {
    vpc_id = module.vpc.vpc_id
    tags = {
      Name = "nop_igw"
    }
  }
  pub_sub_info = [
    {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "ap-south-1a"
      vpc_id            = module.vpc.vpc_id
      tags = {
        Name = "web-01"
      }
    },
    {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-south-1b"
      vpc_id            = module.vpc.vpc_id
      tags = {
        Name = "web-02"
      }
    }
  ]
  pvt_sub_info = [{
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1a"
    vpc_id            = module.vpc.vpc_id
    tags = {
      Name = "db-01"
    }
    },
    {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "ap-south-1b"
      vpc_id            = module.vpc.vpc_id
      tags = {
        Name = "db-02"
      }
  }]
  pub_rt_info = {
    vpc_id = module.vpc.vpc_id
    tags = {
      Name = "public_route_table"
    }
  }
  pub_route_info = {
    route_table_id         = module.vpc.pub_rt_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = module.vpc.gateway_id
  }
  pub_ass_info = {
    subnet_id      = module.vpc.pub_subnet_id
    gateway_id     = module.vpc.gateway_id
    route_table_id = module.vpc.pub_rt_id
  }
  pvt_rt_info = {
    vpc_id = module.vpc.vpc_id
    tags = {
      Name = "pvt_route_table"
    }
  }
  pvt_ass_info = {
    subnet_id      = module.vpc.pvt_subnet_id
    route_table_id = module.vpc.pvt_rt_id
  }
}