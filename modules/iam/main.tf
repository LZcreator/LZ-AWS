module "policy" {
  source      = "./policies"
  project = var.project
  sufix       = var.sufix
  common_tags = var.common_tags
}

module "group" {
  source       = "./groups"
  project = var.project
  sufix        = var.sufix
  common_tags  = var.common_tags
  policy_arn   = module.policy.policy_arn
}

module "user" {
  source       = "./users"
  project      = var.project
  sufix        = var.sufix
  common_tags  = var.common_tags
  group_name   = module.group.group_name
}