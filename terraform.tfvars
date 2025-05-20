aws_region = "us-east-1"

virginia_cidr = "10.10.0.0/16"
subnets       = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  env     = "dev"
  owner   = "MarcosYasmin"
  cloud   = "aws"
  IAC     = "terraform"
  region  = "virginia"
  project = "landingZone"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  ami           = "ami-0e58b56aa4d64231b"
  instance_type = "t2.micro"
}

ingress_ports_list = [22, 80, 443]
