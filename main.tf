terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

locals {
  has_public_subnets = length(coalesce(var.public_subnets, {})) > 0
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_internet_gateway" "igw" {
  count = local.has_public_subnets ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = var.name
  })
}

// Just managing it. In reality, we have no intention on using the default route table.
resource "aws_default_route_table" "vpc" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = merge(var.tags, {
    Name = "${var.name}-default-route-table"
  })
}

module "public_subnets" {
  for_each = var.public_subnets

  source = "./modules/subnet"

  name              = each.key
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  vpc_id            = aws_vpc.vpc.id

  tags = var.tags
}

// Allow each subnet's outgoing traffic to route through the internet gateway.
resource "aws_route" "subnet_ipv4_igw" {
  for_each = module.public_subnets

  route_table_id         = each.value.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id
}

resource "aws_route" "subnet_ipv6_igw" {
  for_each = module.public_subnets

  route_table_id              = each.value.route_table.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.igw[0].id
}

resource "aws_flow_log" "vpc" {
  count = var.flow_logs_bucket_arn != null ? 1 : 0

  log_destination      = var.flow_logs_bucket_arn
  log_destination_type = "s3"
  vpc_id               = aws_vpc.vpc.id
  traffic_type         = "ALL"
}
