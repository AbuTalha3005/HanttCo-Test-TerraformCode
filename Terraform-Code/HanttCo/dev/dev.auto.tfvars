aws_profile        = "default"
project_name        = "HanttCo"
vpc_cidr            = "192.168.1.0/24"
public_subnet_cidr  = "192.168.1.0/26"
private_subnet_cidr = "192.168.1.64/26"
ec2_key_name        = "hanttco-key-pair"
win_ami_id          = "ami-0c858473e6f462bb1" # Windows Server 2022 Base AMI in ap-southeast-1
windows_instance_type = "t3.medium"
az                  = "ap-southeast-1a"
rdp_port            = 3389
https_port          = 443
