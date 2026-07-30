output "internet_gateway" {
  value = one(aws_internet_gateway.igw)
}

output "pubic_subnets" {
  value = { for name, outputs in module.public_subnets : name => merge(outputs.subnet, { route_table = outputs.route_table }) }
}

output "vpc" {
  value = aws_vpc.vpc
}

