terraform {
  backend "s3" {
    bucket         = "sampletfstatebucket"
    key            = "nginx-windows/dev/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    use_lockfile   = true
  }
}
