resource "aws_security_group" "instance_sg" {
  description = "Security group for qnd-graphite"
  vpc_id      = "${data.aws_vpc.selected.id}"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
    from_port   = 2003
    to_port     = 2004
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
    from_port   = 2023
    to_port     = 2034
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
    from_port   = 8125
    to_port     = 8125
    protocol    = "udp"
  }

  ingress {
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
    from_port   = 8126
    to_port     = 8126
    protocol    = "tcp"
  }

  tags = {
    Name    = "${local.resource_identifier}"
    Env     = "${local.env}"
    Team    = "${local.team}"
    Service = "${local.service}"
  }
}
