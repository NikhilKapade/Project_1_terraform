terraform {
  backend "s3" {
    bucket         = "sandman01"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    use_lockfile = true
  }
}

