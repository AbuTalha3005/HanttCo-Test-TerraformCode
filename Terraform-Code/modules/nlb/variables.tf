variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID in which the NLB will be deployed."
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID where the NLB will reside."
  type        = string
}

variable "target_instance_id" {
  description = "The ID of the instance to be attached in both target groups (e.g. Windows instance)."
  type        = string
}

variable "rdp_port" {
  description = "The port that the RDP target group will use."
  type        = number
  default     = 3389
}

variable "https_port" {
  description = "The port that the HTTPS target group (and NLB listener) will use."
  type        = number
  default     = 443
}
