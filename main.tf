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

# EC2 Module (Instances)
# Calls the 'ec2' module to deploy EC2 instances.
# Includes monitoring conditional logic using 'enable_monitoring'.
module "ec2" {
  source        = "./modules/ec2"
  instance_name = var.instance_name
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  project       = var.project
  sufix         = local.sufix
  common_tags   = var.common_tags
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
  source          = "./modules/s3"
  bucket_name     = var.bucket_name
  enable_versioning = var.enable_versioning
  project         = var.project
  sufix           = local.sufix
  common_tags     = var.common_tags
}
