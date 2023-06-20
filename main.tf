locals {
  environments = { for k, v in var.branches : k => v if var.amplify_enabled }
}

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

  name                          = module.labels.id
  repository                    = var.amplify_repository
  description                   = var.description
  platform                      = var.platform
  auto_branch_creation_patterns = var.auto_branch_creation_patterns

  # The default build_spec added by the Amplify Console for React.
  build_spec = var.build_spec

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

  environment_variables       = var.amplify_app_environment_variables
  access_token                = var.access_token
  oauth_token                 = var.oauth_token
  enable_auto_branch_creation = var.enable_auto_branch_creation
  enable_branch_auto_deletion = var.enable_branch_auto_deletion
  enable_basic_auth           = var.enable_basic_auth
  enable_branch_auto_build    = var.enable_branch_auto_build

  dynamic "auto_branch_creation_config" {
    for_each = var.auto_branch_creation_config != null ? [true] : []

    content {
      basic_auth_credentials        = lookup(var.auto_branch_creation_config, "basic_auth_credentials", null)
      build_spec                    = lookup(var.auto_branch_creation_config, "build_spec", null)
      enable_auto_build             = lookup(var.auto_branch_creation_config, "enable_auto_build", null)
      enable_basic_auth             = lookup(var.auto_branch_creation_config, "enable_basic_auth", null)
      enable_performance_mode       = lookup(var.auto_branch_creation_config, "enable_performance_mode", null)
      enable_pull_request_preview   = lookup(var.auto_branch_creation_config, "enable_pull_request_preview", null)
      environment_variables         = lookup(var.auto_branch_creation_config, "environment_variables", null)
      framework                     = lookup(var.auto_branch_creation_config, "framework", null)
      pull_request_environment_name = lookup(var.auto_branch_creation_config, "pull_request_environment_name", null)
      stage                         = lookup(var.auto_branch_creation_config, "stage", null)
    }
  }
  tags = module.labels.tags
}

resource "aws_amplify_backend_environment" "example" {
  count = var.amplify_enabled && var.backend_enable ? 1 : 0

  app_id               = join("", aws_amplify_app.example.*.id)
  environment_name     = var.environment_name
  deployment_artifacts = var.deployment_artifacts
  stack_name           = var.stack_name
}

resource "aws_amplify_branch" "main" {
  count = var.amplify_enabled ? 1 : 0

  app_id                      = join("", aws_amplify_app.example.*.id)
  branch_name                 = var.branches.branch_name
  display_name                = var.branches.display_name
  description                 = var.branches.description
  framework                   = var.branches.framework
  stage                       = var.branches.stage
  enable_auto_build           = var.branches.enable_auto_build
  ttl                         = var.branches.ttl
  environment_variables       = var.branches.environment_variables
  enable_pull_request_preview = var.branches.enable_pull_request_preview
  tags                        = module.labels.tags
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