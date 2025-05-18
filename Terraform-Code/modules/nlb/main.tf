# Allocate an Elastic IP to be associated with the NLB.
resource "aws_eip" "nlb_eip" {
  vpc = true
}

# Create the Network Load Balancer in the public subnet.
resource "aws_lb" "nlb" {
  name               = "${var.project_name}-nlb"
  load_balancer_type = "network"
  internal           = false

  subnet_mapping {
    subnet_id     = var.public_subnet_id
    allocation_id = aws_eip.nlb_eip.allocation_id
  }

  tags = {
    Name = "${var.project_name}-NLB"
  }
}

# Create a target group for RDP (port 3389).
resource "aws_lb_target_group" "rdp_tg" {
  name        = "${var.project_name}-rdp-tg"
  port        = var.rdp_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    protocol = "TCP"
    port     = tostring(var.rdp_port)
  }
}

# Create a target group for HTTPS (port 443) for Nginx.
resource "aws_lb_target_group" "https_tg" {
  name        = "${var.project_name}-https-tg"
  port        = var.https_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    protocol = "TCP"
    port     = tostring(var.https_port)
  }
}

# Create an NLB listener for RDP on port 3389.
resource "aws_lb_listener" "rdp_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = var.rdp_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rdp_tg.arn
  }
}

# Create an NLB listener for HTTPS on port 443.
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = var.https_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https_tg.arn
  }
}

# Attach the target (Windows EC2 Instance) to the RDP target group.
resource "aws_lb_target_group_attachment" "rdp_attachment" {
  target_group_arn = aws_lb_target_group.rdp_tg.arn
  target_id        = var.target_instance_id
  port             = var.rdp_port
}

# Attach the target (Windows EC2 Instance) to the HTTPS target group.
resource "aws_lb_target_group_attachment" "https_attachment" {
  target_group_arn = aws_lb_target_group.https_tg.arn
  target_id        = var.target_instance_id
  port             = var.https_port
}
