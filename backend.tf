terraform {
  backend "s3" {
    bucket = "statefile-terrafrom"
    key = "saurav/terraform.tfstate"
    region = "ap-southeast-2"
  }
}