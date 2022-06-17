resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.vpc_cidr_block
  tags                 = var.vpc_tags
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
}

resource "aws_subnet" "terraform_subnet1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.subnet_cidr_block1
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone1
}

resource "aws_subnet" "terraform_subnet2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.subnet_cidr_block2
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone2
}

resource "aws_internet_gateway" "terraform_internet_gateway" {
  vpc_id = aws_vpc.terraform_vpc.id
}

resource "aws_route_table" "terraform_public_crt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.terraform_internet_gateway.id
  }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.terraform_subnet1.id
  route_table_id = aws_route_table.terraform_public_crt.id
}