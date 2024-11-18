resource "aws_s3_bucket" "terraform_state" {
  bucket = "davshe-technion-cicd-13579"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}
