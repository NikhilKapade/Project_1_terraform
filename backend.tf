terraform {
  backend "s3" {
    bucket         = "sandman01"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dynamoDB"
  }
}

