terraform {
  backend "s3" {
    bucket = "terraform-backend-lab"
    key    = "terrafrom.tfstate"
    region = "us-east-1"
    dynamodb_table = "state"
  }
}
