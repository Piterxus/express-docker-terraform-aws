terraform {
  backend "s3" {
    bucket = "terraformdestroypedsanlan"
    key    = "key"
    region = "us-east-1"
  }
}