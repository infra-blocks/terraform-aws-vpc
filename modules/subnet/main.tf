terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  tags = merge(var.tags, { Name = var.name })
}
