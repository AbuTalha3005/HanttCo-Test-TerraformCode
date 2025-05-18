terraform {
  backend "s3" {
    bucket         = "sampletfstatebucket"                 # Replace with your S3 bucket name
    key            = "nginx-windows/dev/terraform.tfstate"         # Unique state file path for dev
    region         = "ap-southeast-1"
    encrypt        = true
    use_lockfile   = true
  }
}
