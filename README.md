<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS AMPLIFY
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to provision AWS Amplify apps, backend environments, branches, domain associations, and webhooks.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-aws-amplify/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-aws-amplify/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-aws-amplify/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-aws-amplify/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-amplify'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+AMPLIFY&url=https://github.com/clouddrove/terraform-aws-amplify'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+AMPLIFY&url=https://github.com/clouddrove/terraform-aws-amplify'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-amplify/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
  ```hcl
  module "amplify" {
   source = "../"
   name        = "amplify"
   environment = "test"
   label_order = ["name", "environment"]
   amplify_enabled        = true
   environment_name       = "prod"
   domain_name            = ["newloop.eu", "newloop.dk"]
   amplify_repository     =  "https://github.com/clouddrove-sandbox/terraform-aws-amplify"
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
  ```






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
| ttl | Content Time To Live (TTL) for the website in seconds. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amplify App ARN |
| default\_domain | Amplify App domain (non-custom) |
| name | Amplify App name |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-amplify/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-amplify)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
