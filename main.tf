module "network" {
  source = "./modules/network"
}

module "ec2" {
  source = "./modules/network"
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "budgets" {
  source = "./modules/budgets"
}