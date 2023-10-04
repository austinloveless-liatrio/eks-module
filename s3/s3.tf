resource "aws_s3_bucket" "b" {
bucket = "crossplane-terraform-liatrio-test-1"
acl    = "private"

tags = {
    Name        = "My bucket"
    Environment = "Dev"
}
}