###VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {

    Name = "${var.env}-vpc"

  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "public-subnet-${split("-", "us-east-1a")[2]}"
  }
}

##subnets

resource "aws_subnet" "web" {
  count             = length(var.web_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.web_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "web-subnet-${split("-", "us-east-1a")[2]}"
  }
}

resource "aws_subnet" "app" {
  count             = length(var.app_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "app-subnet-${split("-", "us-east-1a")[2]}"
  }
}

resource "aws_subnet" "db" {
  count             = length(var.db_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "db-subnet-${split("-", "us-east-1a")[2]}"
  }
}

###Route table

resource "aws_route_table" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "public-rt-${split("-", "us-east-1a")[2]}"
  }
}

resource "aws_route_table" "web" {
  count = length(var.web_subnets)
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "web-rt-${split("-", "us-east-1a")[2]}"
  }
}

resource "aws_route_table" "app" {
  count = length(var.app_subnets)
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "app-rt-${split("-", "us-east-1a")[2]}"
  }
}

resource "aws_route_table" "db" {
  count = length(var.db_subnets)
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "db-rt-${split("-", "us-east-1a")[2]}"
  }
}