provider "aws" {
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "mi-bucket-terraform"
    key    = "env/main.tfstate"
    region = "eu-west-3"
  }
}

resource "aws_vpc" "landing_zone_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.landing_zone_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.landing_zone_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.landing_zone_vpc.id
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
