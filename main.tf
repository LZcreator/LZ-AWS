locals {
  sufix = "${var.project}-${var.environment}"
}

module "network" {
  source      = "./modules/network"
  environment = var.environment
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}

module "iam" {
  source      = "./modules/iam"
  environment = var.environment
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}

module "budget" {
  source      = "./modules/budgets"
  environment = var.environment
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}