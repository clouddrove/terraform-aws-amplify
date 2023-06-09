provider "aws" {
  region = "eu-west-1"
}

module "amplify" {
  source = "../"

  name        = "test"
  environment = "amplify"
  label_order = ["name", "environment"]

  amplify_enabled  = true
  environment_name = "staging"
  platform         = "WEB"

  auto_branch_creation_config = {
    # Enable auto build for the created branches
    enable_auto_build = true
  }
  enable_auto_branch_creation = false
  enable_basic_auth           = false
  enable_branch_auto_build    = true
  enable_branch_auto_deletion = true

  auto_branch_creation_patterns = [
    "*",
    "*/**"
  ]

  domain_name            = ["test-example.com", "www.test-example.com"]
  amplify_repository     = "https://github.com/nileshgadgi/gitrepo"
  access_token           = "ghp_xxxxxjq0mUrbxxxxxxxuqxh4pxxxxxxx192m"
  sub_domain_prefix_name = "scan"
  deployment_artifacts   = "app-example-deployment"
  branch_framework       = "Web"
  branch_stage           = "PRODUCTION"
  ttl                    = 5
  build_spec             = <<-EOT
    version: 1
    frontend:
      phases:
        # IMPORTANT - Please verify your build commands
        build:
          commands: []
      artifacts:
        # IMPORTANT - Please verify your build output directory
        baseDirectory: /
        files:
          - '**/*'
      cache:
        paths: []
  EOT

  # Environment variables for the branch.
  amplify_app_environment_variables = {
    ENV = "master"
  }

  custom_rules = [
    {
      source = "/<*>"
      status = "404"
      target = "/index.html"
    }
  ]

  branches = {
    branch_name       = "master"
    framework         = "WEB"
    stage             = "DEVELOPMENT"
    enable_auto_build = true
  }
}
