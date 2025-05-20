resource "aws_vpc" "vpc_lz" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "lz-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_lz.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}
