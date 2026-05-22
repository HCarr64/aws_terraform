# Allow HTTP inbound from all
# Allow all data outbound
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Allow inbound HTTP (80), Outbound all"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound HTTP from all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    description = "All outbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "0" # All
    to_port = "0" # All
    protocol = "all"
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

# Allow HTTP inbound from ALB Security Group
# Allow all data outbound
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Allow inbound HTTP (80) from source alb-sg, Outbound all"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound HTTP from all"
    security_groups = [aws_security_group.alb.id]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    description = "All outbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "0" # All
    to_port = "0" # All
    protocol = "all"
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}
