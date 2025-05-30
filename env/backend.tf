terraform {
  backend "s3" {
    bucket         = "landing-zone-terraform-state"
    key            = "env/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "landing-zone-state-lock"
    encrypt        = "true"
  }
}