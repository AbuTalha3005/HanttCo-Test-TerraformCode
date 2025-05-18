variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID from the VPC module"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID from the VPC module"
  type        = string
}

variable "win_ami_id" {
  description = "AMI ID for the Windows instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "ec2_key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "depends_on_vpc" {
  description = "Dummy variable to force dependency on VPC module"
  type        = string
}
