terraform {
  backend "s3" {
    bucket         = "landing-zone-terraform-state"
    key            = "env/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "landing-zone-state-lock"
    encrypt        = "true"
  }
}