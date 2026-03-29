terraform {
  backend "s3" {
    bucket         = "terraform-aws-tf-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "aws-tf-lock-table"
    encrypt        = true
  }
}