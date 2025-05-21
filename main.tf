locals {
  sufix = "${var.project}-${var.environment}"
}

module "network" {
  source      = "./modules/network"
  project     = var.project
  common_tags = var.common_tags
  sufix       = local.sufix
}

module "iam" {
  source      = "./modules/iam"
  project     = var.project
  sufix       = local.sufix
  common_tags = var.common_tags
}

module "budget" {
  source       = "./modules/budgets"
  sufix        = local.sufix
  common_tags  = var.common_tags
}
