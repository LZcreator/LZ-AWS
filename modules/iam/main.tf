module "policy" {
  source      = "./policies"
  project     = var.project
  sufix       = var.sufix
  common_tags = var.common_tags
}

module "group" {
  source             = "./groups"
  project            = var.project
  sufix              = var.sufix
  common_tags        = var.common_tags
  logs_s3_policy_arn = module.policy.logs_s3_policy_arn
  admin_policy_arn   = module.policy.admin_policy_arn
  infra_policy_arn   = module.policy.infra_policy_arn
  billing_policy_arn = module.policy.billing_policy_arn
}

module "user" {
  source              = "./users"
  project             = var.project
  sufix               = var.sufix
  common_tags         = var.common_tags
  admin_group_name    = module.group.admin_group_name
  logs_s3_group_name  = module.group.logs_s3_group_name
  infra_group_name    = module.group.infra_group_name
  billing_group_name = module.group.billing_group_name
}