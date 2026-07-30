module "example" {
  source = "git@github.com:infra-blocks/tf-module-template"

  example_input = "example"
}

locals {
  # This will be "EXAMPLE"
  example_output = module.example.outputs.example_output
}
