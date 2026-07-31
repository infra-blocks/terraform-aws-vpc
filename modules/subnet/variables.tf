variable "availability_zone" {
  type = string
  description = "This subnet's availability zone."
}

variable "cidr_block" {
  type = string
  description = "This subnet's CIDR block."
}

variable "name" {
  type = string
  description = "This subnet's name."
}

variable "vpc_id" {
  type = string
  description = "The ID of the VPC this subnet belongs to."
}

variable "tags" {
  type        = map(string)
  description = "Map of default tags to be applied to managed resources"
  default     = {}
}
