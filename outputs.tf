output "name" {
  description = "Amplify App name"
  value       = join("", aws_amplify_app.example[*].name)
}

output "arn" {
  description = "Amplify App ARN "
  value       = join("", aws_amplify_app.example[*].arn)
}

output "default_domain" {
  description = "Amplify App domain (non-custom)"
  value       = join("", aws_amplify_app.example[*].default_domain)
}
