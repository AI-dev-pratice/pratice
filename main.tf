terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "public_subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.0.0/22"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.4.0/22"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.8.0/22"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.12.0/22"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_2"
  }
}

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "main_igw"
#   }
# }

# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
#   tags = {
#     Name = "public_rt"
#   }
# }

# resource "aws_route_table_association" "public_subnet_1_assoc" {
#   subnet_id      = aws_subnet.public_subnet-1.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_subnet_2_assoc" {
#   subnet_id      = aws_subnet.public_subnet-2.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_eip" "nat_eip" {
#   domain = "vpc"
#   tags = {
#     Name = "nat_eip"
#   }
# }

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public_subnet-1.id
#   tags = {
#     Name = "nat_gw"
#   }
#   depends_on = [aws_internet_gateway.igw]
# }