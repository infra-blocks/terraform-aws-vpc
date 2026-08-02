# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2026-01-02

### Fixed

- The previous version did not associate the subnet to its route table. It
provisioned both, just didn't associate them. This version addresses this issue.

## [1.0.2] - 2026-01-01

### Fixed

- Updated the "pubic_subnets" output's name to *public*. Even though this is
a breaking change, it was clearly a bug mafocka.

## [1.0.1] - 2026-07-31

### Fixed

- Fixed poor formatting due to lint script bug.

## [1.0.0] - 2026-07-31

### Added

- First implementation that only supports public subnets at the time of this writing. Future
iteration incoming!

[1.0.3]: https://github.com/infra-blocks/terraform-aws-vpc/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/infra-blocks/terraform-aws-vpc/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/infra-blocks/terraform-aws-vpc/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/infra-blocks/terraform-aws-vpc/releases/tag/v1.0.0
