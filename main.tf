# Local Values
# Defines a local variable 'sufix' by combining the project name and environment.
# Example result: "myproject-dev"
locals {
  sufix = "${var.project}-${var.environment}"
}

# Network Module
# Calls the 'network' module to provision the networking infrastructure (VPC, subnets, IGW, route tables, etc.)
# Inputs:
# - project: project name
# - common_tags: common tags for all resources
# - sufix: suffix used for resource names
module "network" {
  source      = "./modules/network"
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}

# IAM Module
# Calls the 'iam' module to provision IAM resources (users, roles, policies, groups, etc.)
# Inputs are similar to the network module.
module "iam" {
  source      = "./modules/iam"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
}

# Budget Module
# Calls the 'budgets' module to create an AWS Budget (used for cost control and alerts).
# Inputs:
# - sufix: used for resource naming
# - common_tags: applied as tags to all budget resources
module "budget" {
  source      = "./modules/budgets"
  sufix       = local.sufix
  common_tags = var.common_tags
}