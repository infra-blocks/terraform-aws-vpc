variable "name" {
  type        = string
  description = "The name associated to the VPC."
}

variable "cidr_block" {
  type        = string
  description = <<EOF
The CIDR block of the VPC. It is expected to have a mask of 16 bits, as this module generates
several subnets with 24 bit masks.
EOF

  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/16$", var.cidr_block))
    error_message = "Invalid CIDR block for VPC CIDR."
  }
}

variable "flow_logs_bucket_arn" {
  type        = string
  description = <<EOT
When provided, this bucket ARN is used to enable VPC flow logs on the VPC.
It tracks all traffic across the VPC and outputs in the S3 bucket.

Permissions need to be granted on the S3 bucket directly, see here:
https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs-s3.html#flow-logs-s3-permissions
EOT
  default     = null
}

variable "public_subnets" {
  type = map(object({
    /*
    This subnet's CIDR block.
    */
    cidr_block = string
    /*
    This subnet's availability zone name. For example, "us-east-1a".
    */
    availability_zone = string
  }))
  description = <<EOT

EOT
}

variable "tags" {
  type        = map(string)
  description = "Map of default tags to be applied to managed resources"
  default     = {}
}
