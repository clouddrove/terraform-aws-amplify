output "name" {
  value       = module.amplify.*.name
  description = "Amplify App name"

}

output "arn" {
  value       = module.amplify.*.arn
  description = "Amplify App ARN "

}

output "default_domain" {
  value       = module.amplify.*.default_domain
  description = "Amplify App domain (non-custom)"

}
