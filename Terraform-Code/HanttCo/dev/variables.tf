variable "aws_profile" {
  description = "AWS CLI profile to use for deployment"
  type        = string
  default     = "default"  
}

variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "ec2_key_name" {
  description = "EC2 SSH key pair name"
  type        = string
}

variable "win_ami_id" {
  description = "AMI ID for the Windows instance "
  type        = string
}

variable "windows_instance_type" {
  description = "Instance type for Windows EC2"
  type        = string
  default     = "t3.medium"
}

variable "az" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "rdp_port" {
  description = "Port for RDP (default 3389)"
  type        = number
  default     = 3389
}

variable "https_port" {
  description = "Port for HTTPS (default 443)"
  type        = number
  default     = 443
}
