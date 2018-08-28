variable "region" {}

provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "bucket_one" {
    bucket = "newsspbucket"
    acl = "private"

    tags {
      Name = "ssp bucket"
      Environment = "Dev"
      Team = "SSPCLOUDPRO"
    }
}

// Output the ID of the Subnet Group
output "s3 bucket name" {
    value = "${aws_s3_bucket.bucket_one.id}"
}




#data "terraform_remote_state" "store_tf_state" {
#  backend = "s3"
#
#  config {
#    bucket = "${aws_s3_bucket.bucket_one.bu}"
#    key    = "terraform/s3/terraform.tfstate"
#    region = "us-east-1"
#    acl    = "bucket-owner-full-control"
#  }
#}

