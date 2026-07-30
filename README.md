# tf-module-template
[![Build](https://github.com/infra-blocks/tf-module-template/actions/workflows/build.yml/badge.svg)](https://github.com/infra-blocks/tf-module-template/actions/workflows/build.yml)
[![Release](https://github.com/infra-blocks/tf-module-template/actions/workflows/release.yml/badge.svg)](https://github.com/infra-blocks/tf-module-template/actions/workflows/release.yml)

This repository is a template to instantiate Terraform/OpenTofu module repositories.

Follow these steps after instantiating the template:
- Do a global search & replace for `tf-module-template` and replace it with the name of your repository
- Describe the package and its usage in this readme.
- Update the package code, the module [examples](./examples) and the [tests](./tests)
- Prepare the [changelog](CHANGELOG.md) for the first version of the module that will be released.
