terraform {
  backend "s3" {
    bucket = "eleovie"
    key    = "eleovie/terraform"
    region = "us-east-1"
  }
}
