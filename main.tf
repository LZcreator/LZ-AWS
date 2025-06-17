# Local Values
# Defines a local variable 'sufix' by combining the project name and environment.
# Example result: "my_project-dev"
locals {
  sufix = "${var.project}-${var.environment}"
}

# Networking Module
# Calls the 'network' module to provision networking infrastructure (VPC, subnets, IGW, route tables, etc.).
# Inputs:
# - project: project name
# - common_tags: common tags for all resources
# - sufix: suffix used in resource naming
module "network" {
  source      = "./modules/network"
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}

# IAM Module
# Calls the 'iam' module to provision IAM resources (users, roles, policies, groups, etc.).
module "iam" {
  source      = "./modules/iam"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
}

# Budget Module
# Calls the 'budgets' module to create an AWS budget (used for cost control and alerts).
module "budget" {
  source      = "./modules/budgets"
  sufix       = local.sufix
  common_tags = var.common_tags
}

# EC2 Module (Instances)
# Calls the 'ec2' module to deploy EC2 instances.
# Includes monitoring conditional logic using 'enable_monitoring'.
module "ec2" {
  source      = "./modules/ec2"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
  ec2_specs   = var.ec2_specs
  enable_monitoring = var.enable_monitoring
}

# CloudWatch Module (Monitoring & Logging)
# Calls the 'cloudwatch' module to configure CloudWatch for monitoring.
module "cloudwatch" {
  source      = "./modules/cloudwatch"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
  enable_monitoring = var.enable_monitoring
}

# S3 Module (Storage)
# Calls the 's3' module to provision an S3 bucket.
module "s3" {
  source      = "./modules/s3"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
  bucket_name = var.bucket_name
}
