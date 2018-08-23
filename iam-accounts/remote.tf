provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "k8s-sspbucket"
    key    = "terraform/iam-accounts/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}

