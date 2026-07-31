# terraform-aws-vpc
[![Build](https://github.com/infra-blocks/tf-module-template/actions/workflows/build.yml/badge.svg)](https://github.com/infra-blocks/tf-module-template/actions/workflows/build.yml)
[![Release](https://github.com/infra-blocks/tf-module-template/actions/workflows/release.yml/badge.svg)](https://github.com/infra-blocks/tf-module-template/actions/workflows/release.yml)

A VPC networking module to provision:
- The VPC
- Its subnets
- Their associated route tables (1 per subnet)
- Optionally, an internet gateway (when at least 1 public subnet is defined)
- Routes within the public subnets to reach the gateway for outgoing traffic
