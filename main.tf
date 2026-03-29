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
    cidr_block = "192.168.0.0/20"
    dns_support = true
    dns_hostnames = true
    tags = {
        Name = "main_vpc"
    }
  
}

resource "aws_subnet" "public_subnet-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.0.0/22"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = false
    tags = {
        Name = "public_subnet_1"
    }
}

resource "aws_subnet" "public_subnet-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.4.0/22"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "public_subnet_2"
    }
}
resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.8.0/22"
    availability_zone = "ap-south-1a"       
    map_public_ip_on_launch = false
    tags = {    
        Name = "private_subnet_1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.12.0/22"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "private_subnet_2"
    }
}