provider "aws" {
  region = "eu-west-1"
}

module "amplify" {
  source = "../"

  name        = "amplify"
  environment = "test"
  label_order = ["name", "environment"]

  amplify_enabled        = true
  environment_name       = "prod"
  domain_name            = ["newloop.eu", "newloop.dk"]
  amplify_repository     = "https://github.com/clouddrove-sandbox/terraform-aws-amplify-app"
  access_token           = "ghxxxxxm06Sd3KqkafBVu0xzcxcxcv0EA8AK"
  amplify_branch_name    = "main"
  sub_domain_prefix_name = "scan"
  deployment_artifacts   = "app-example-deployment"
  stack_name             = "amplify-app-example"
  branch_framework       = "React"
  branch_stage           = "PRODUCTION"
  branch_environment_variables = {
    ENV = "test"
  }
  amplify_app_environment_variables = {
    REACT_APP_API_SERVER = ""
  }

  custom_rules = [
    {
      source = "/01/<p01>/21/<p21>"
      status = "302"
      target = "/?p01=<p01>&p21=<p21> "
    }
  ]
}
