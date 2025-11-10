aws_region      = "us-east-1"
environment     = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
instance_count  = 2
instance_type   = "t3.micro"
ami_id          = "ami-0c02fb55956c7d316"