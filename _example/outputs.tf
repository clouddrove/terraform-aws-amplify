output "name" {
  value       = module.amplify_app_web.*.name
  description = "Amplify App name"

}

output "arn" {
  value       = module.amplify_app_web.*.arn
  description = "Amplify App ARN "

}

output "default_domain" {
  value       = module.amplify_app_web.*.default_domain
  description = "Amplify App domain (non-custom)"

}
