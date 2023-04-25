#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'"
}

variable "amplify_repository" {
  type        = string
  default     = "https://github.com/clouddrove-sandbox/terraform-aws-amplify-app"
  description = "The repository for the Amplify app"
}

variable "domain_name" {
  type        = list(any)
  default     = []
  description = "Domain name for the domain association."
}

variable "access_token" {
  type        = string
  default     = "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"
  description = "Personal access token for a third-party source"
}

variable "amplify_branch_name" {
  type        = string
  default     = "test"
  description = "Name for the branch."
}
variable "sub_domain_prefix_name" {
  type        = string
  default     = "scam"
  description = "Prefix setting for the subdomain."
}
variable "amplify_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the amplify creation."
}

variable "environment_name" {
  type        = string
  default     = "prod"
  description = " Amplify environment name for the pull request."
}

variable "deployment_artifacts" {
  type        = string
  default     = "app-example-deployment"
  description = "Name of deployment artifacts."
}
variable "stack_name" {
  type        = string
  default     = "amplify-app-example"
  description = "AWS CloudFormation stack name of a backend environment."
}
variable "branch_framework" {
  type        = string
  default     = "React"
  description = "Framework for the branch."
}
variable "branch_stage" {
  type        = string
  default     = "PRODUCTION"
  description = "Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST."
}

variable "custom_rules" {
  type = list(object({
    condition = optional(string)
    source    = string
    status    = optional(string)
    target    = string
  }))
  default     = []
  nullable    = false
  description = "The custom rules to apply to the Amplify App"
}

variable "branch_environment_variables" {
  type        = map(string)
  description = "The environment variables for the Amplify app"
  default     = {}
}
variable "amplify_app_environment_variables" {
  type        = map(string)
  description = "The environment variables for the Amplify app"
  default     = {}
}