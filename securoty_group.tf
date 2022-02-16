resource "aws_security_group" "allow_ec2_instance_connect" {
  name        = "${var.prefix}-ec2-instance-connect"
  description = "Allow EC2 Instance Connect inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "EC2 Instance Connect"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ec2_instance_connect_sidr_block]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-ec2-instance-connect"
  }
}
