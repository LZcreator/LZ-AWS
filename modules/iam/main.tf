# Module for defining and creating IAM policies
module "policy" {
  source      = "./policies"      # Path to the policies module
  project     = var.project       # Project name or identifier (for tagging or naming)
  sufix       = var.sufix         # Unique suffix for resource names to avoid conflicts
  common_tags = var.common_tags   # Common tags applied to all resources
}

# Module for defining IAM groups and attaching the previously created policies
module "group" {
  source             = "./groups"               # Path to the groups module
  project            = var.project
  sufix              = var.sufix
  common_tags        = var.common_tags
  logs_s3_policy_arn = module.policy.logs_s3_policy_arn     # ARN of the S3/Logs policy
  admin_policy_arn   = module.policy.admin_policy_arn       # ARN of the Admin policy
  infra_policy_arn   = module.policy.infra_policy_arn       # ARN of the Infrastructure policy
  billing_policy_arn = module.policy.billing_policy_arn     # ARN of the Billing policy
}

# Module for creating IAM users and associating them with the appropriate groups
module "user" {
  source              = "./users"               # Path to the users module
  project             = var.project
  sufix               = var.sufix
  common_tags         = var.common_tags
  admin_group_name    = module.group.admin_group_name      # Name of the Admin IAM group
  logs_s3_group_name  = module.group.logs_s3_group_name    # Name of the Logs S3 IAM group
  infra_group_name    = module.group.infra_group_name      # Name of the Infra IAM group
  billing_group_name  = module.group.billing_group_name    # Name of the Billing IAM group
}