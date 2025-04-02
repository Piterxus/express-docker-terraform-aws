terraform {
  backend "s3" {
    bucket = "terraformdestroypedsanlan"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}