    resource "aws_s3_bucket" "bucket" {
    bucket = "crossplane-austinloveless-liatrio"
    acl    = "private"

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
    }