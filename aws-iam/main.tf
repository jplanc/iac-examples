module "prod-ci" {
  source  = "./modules/aws-iam"

  aws_account_id  = var.aws_account_id
  resource_suffix = "prod-ci"
}
