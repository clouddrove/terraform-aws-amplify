module "labels" {
  source  = "clouddrove/labels/aws"
  version = "1.3.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}

resource "aws_amplify_app" "example" {
  count = var.amplify_enabled ? 1 : 0

  name       = module.labels.id
  repository = var.amplify_repository

  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  dynamic "custom_rule" {
    for_each = var.custom_rules

    content {
      condition = lookup(custom_rule.value, "condition", null)
      source    = custom_rule.value.source
      status    = lookup(custom_rule.value, "status", null)
      target    = custom_rule.value.target
    }
  }

  environment_variables = var.amplify_app_environment_variables
  access_token          = var.access_token
  tags                  = module.labels.tags
}

resource "aws_amplify_backend_environment" "example" {
  count = var.amplify_enabled ? 1 : 0

  app_id           = join("", aws_amplify_app.example.*.id)
  environment_name = var.environment_name

  deployment_artifacts = var.deployment_artifacts
  stack_name           = var.stack_name
}

resource "aws_amplify_branch" "main" {
  count = var.amplify_enabled ? 1 : 0

  app_id      = join("", aws_amplify_app.example.*.id)
  branch_name = var.amplify_branch_name

  framework = var.branch_framework
  stage     = var.branch_stage

  environment_variables = var.branch_environment_variables
  tags                  = module.labels.tags
}

resource "aws_amplify_domain_association" "example" {
  count = var.amplify_enabled ? length(var.domain_name) : 0


  app_id                = join("", aws_amplify_app.example.*.id)
  domain_name           = element(var.domain_name, count.index)
  wait_for_verification = false

  # https://example.com
  sub_domain {
    branch_name = join("", aws_amplify_branch.main.*.branch_name)
    prefix      = var.sub_domain_prefix_name
  }

  # https://www.example.com
  sub_domain {
    branch_name = join("", aws_amplify_branch.main.*.branch_name)
    prefix      = var.sub_domain_prefix_name
  }

}

resource "aws_amplify_webhook" "master" {
  count = var.amplify_enabled ? 1 : 0

  app_id      = join("", aws_amplify_app.example.*.id)
  branch_name = join("", aws_amplify_branch.main.*.branch_name)
  description = "triggermaster"

}