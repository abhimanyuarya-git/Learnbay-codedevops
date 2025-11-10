vpc_name           = "demo-vpc"
cidr_block         = "10.0.0.0/16"
environment        = "dev"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.10.0/24", "10.0.20.0/24"]
enable_nat_gateway = true