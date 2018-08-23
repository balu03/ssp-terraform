terraform {
  backend "s3" {
    bucket = "k8s-sspbucket"
    key    = "terraform/s3-code/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}

