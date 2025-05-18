#############################
# IAM Role, Instance Profile, and Security Group for Windows EC2
#############################

resource "aws_iam_role" "windows_ec2_role" {
  name = "${var.project_name}_windows_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "windows_ssm" {
  role       = aws_iam_role.windows_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "windows_instance_profile" {
  name = "${var.project_name}_windows_instance_profile"
  role = aws_iam_role.windows_ec2_role.name
}

resource "aws_security_group" "windows_ec2_sg" {
  name_prefix = "${var.project_name}-windows-ec2-sg-"
  description = "Security group for Windows EC2 instance with Nginx"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#############################
# Windows EC2 Instance Resource
#############################

resource "aws_instance" "windows_ec2_instance" {
  ami                         = var.win_ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id  
  vpc_security_group_ids      = [aws_security_group.windows_ec2_sg.id]
  key_name                    = var.ec2_key_name
  iam_instance_profile        = aws_iam_instance_profile.windows_instance_profile.name
  associate_public_ip_address = false                  

  tags = {
    Name = "${var.project_name}-Windows-EC2"
  }

  # Force dependency on the VPC using a dummy dependency variable.
  depends_on = [var.depends_on_vpc]
}
