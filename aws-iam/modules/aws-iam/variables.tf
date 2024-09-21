variable "aws_account_id" {
  description = "The account to deploy IAM resources in"
  type        = string
}

variable "resource_suffix" {
  description = "Suffix for all module resources"
  type        = string
}
