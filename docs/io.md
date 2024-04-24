## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_token | Personal access token for a third-party source | `string` | `"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"` | no |
| amplify\_app\_environment\_variables | The environment variables for the Amplify app | `map(string)` | `{}` | no |
| amplify\_enabled | Flag to control the amplify creation. | `bool` | `true` | no |
| amplify\_repository | The repository for the Amplify app | `string` | `"https://github.com/clouddrove-sandbox/terraform-aws-amplify-app"` | no |
| auto\_branch\_creation\_config | The automated branch creation configuration for the Amplify app | <pre>object({<br>    basic_auth_credentials        = optional(string)<br>    build_spec                    = optional(string)<br>    enable_auto_build             = optional(bool)<br>    enable_basic_auth             = optional(bool)<br>    enable_performance_mode       = optional(bool)<br>    enable_pull_request_preview   = optional(bool)<br>    environment_variables         = optional(map(string))<br>    framework                     = optional(string)<br>    pull_request_environment_name = optional(string)<br>    stage                         = optional(string)<br>  })</pre> | `null` | no |
| auto\_branch\_creation\_patterns | The automated branch creation glob patterns for the Amplify app | `list(string)` | `[]` | no |
| backend\_enable | Enables backend environment creation for the Amplify app | `bool` | `false` | no |
| branches | n/a | <pre>object({<br>    branch_name                 = string<br>    framework                   = optional(string)<br>    display_name                = optional(string)<br>    description                 = optional(string)<br>    stage                       = optional(string)<br>    enable_auto_build           = optional(bool)<br>    ttl                         = optional(number)<br>    enable_performance_mode     = optional(bool)<br>    enable_pull_request_preview = optional(bool)<br>    environment_variables       = optional(map(string))<br>  })</pre> | n/a | yes |
| build\_spec | The [build specification](https://docs.aws.amazon.com/amplify/latest/userguide/build-settings.html) (build spec) for the Amplify app.<br>If not provided then it will use the `amplify.yml` at the root of your project / branch. | `string` | `null` | no |
| custom\_rules | The custom rules to apply to the Amplify App | <pre>list(object({<br>    condition = optional(string)<br>    source    = string<br>    status    = optional(string)<br>    target    = string<br>  }))</pre> | `[]` | no |
| deployment\_artifacts | Name of deployment artifacts. | `string` | `"app-example-deployment"` | no |
| description | The description for the Amplify app | `string` | `null` | no |
| domain\_name | Domain name for the domain association. | `list(any)` | `[]` | no |
| enable\_auto\_branch\_creation | Enables automated branch creation for the Amplify app | `bool` | `false` | no |
| enable\_basic\_auth | Enables basic authorization for the Amplify app.<br>This will apply to all branches that are part of this app. | `bool` | `false` | no |
| enable\_branch\_auto\_build | Enables auto-building of branches for the Amplify App | `bool` | `true` | no |
| enable\_branch\_auto\_deletion | Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| environment\_name | Amplify environment name for the pull request. | `string` | `"prod"` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| oauth\_token | The OAuth token for a third-party source control system for the Amplify app.<br>The OAuth token is used to create a webhook and a read-only deploy key.<br>The OAuth token is not stored. | `string` | `null` | no |
| platform | The platform or framework for the Amplify app | `string` | `"WEB"` | no |
| stack\_name | AWS CloudFormation stack name of a backend environment. | `string` | `"amplify-app-example"` | no |
| sub\_domain\_prefix\_name | Prefix setting for the subdomain. | `string` | `"scam"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amplify App ARN |
| default\_domain | Amplify App domain (non-custom) |
| name | Amplify App name |

