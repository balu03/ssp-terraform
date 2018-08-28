###
### Users
###

resource "aws_iam_user" "ssp" {
  name = "ssp"
  path = "/"
}

resource "aws_iam_access_key" "ssp" {
  user = "${aws_iam_user.ssp.name}"
}

resource "aws_iam_user_policy" "ssp_ro" {
  name = "mobile_s3_policy"
  user = "${aws_iam_user.ssp.name}"

  policy =<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": "s3:ListAllMyBuckets",
        "Resource": "*"
    },
    {
      "Sid":"S3Access",
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::newsspbucket/*"
    },
    {
            "Sid": "AllowListBucketIfSpecificPrefixIsIncludedInRequest",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::newsspbucket"
            ]
        }
  ]
}
EOF
}

output "id" {
  value = "${aws_iam_access_key.ssp.id}"
}

output "secret" {
  value = "${aws_iam_access_key.ssp.secret}"
}


// Output the ID of the Subnet Group
output "IAM Uname" {
    value = "${aws_iam_user.ssp.id}"
}
