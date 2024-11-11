plugin "aws" {
  enabled = true
  version = "0.34.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  #deep_check = true
}

plugin "terraform" {
    enabled = true
    version = "0.10.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

rule "terraform_naming_convention" {
  enabled = false
}

rule "terraform_standard_module_structure" {
  enabled = false
}
