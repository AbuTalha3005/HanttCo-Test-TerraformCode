provider "aws" {
  region  = "ap-southeast-1"
  profile = var.aws_profile
}

module "vpc" {
  source              = "../../modules/vpc"
  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.az
}

module "ec2_windows" {
  source             = "../../modules/ec2/windows"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_id  = module.vpc.private_subnet_id 
  win_ami_id         = var.win_ami_id
  instance_type      = var.windows_instance_type
  ec2_key_name       = var.ec2_key_name
  depends_on_vpc     = module.vpc.vpc_id            
}

module "nlb" {
  source             = "../../modules/nlb"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  target_instance_id = module.ec2_windows.windows_instance_id
  rdp_port           = var.rdp_port        # typically 3389
  https_port         = var.https_port      # typically 443
}

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "windows_instance_id" {
  description = "The Windows EC2 instance ID"
  value       = module.ec2_windows.windows_instance_id
}

output "nlb_dns" {
  description = "The DNS name of the NLB"
  value       = module.nlb.nlb_dns
}
