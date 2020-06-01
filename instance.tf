resource "random_shuffle" "subnet_id" {
  input        = ["${data.aws_subnet_ids.public_subnets.ids}"]
  result_count = 1
}

resource "aws_instance" "instance" {
  ami                         = "${data.aws_ami.fcos.id}"
  associate_public_ip_address = true
  subnet_id                   = "${random_shuffle.subnet_id.result[0]}"
  instance_type               = "t3a.micro"
  user_data                   = "${data.local_file.init.content}"

  root_block_device {
    volume_size = 30
  }

  key_name = "${var.key_name}"

  tags = {
    Name    = "${local.resource_identifier}"
    Env     = "${local.env}"
    Team    = "${local.team}"
    Service = "${local.service}"
  }

  volume_tags = {
    Name    = "${local.resource_identifier}"
    Env     = "${local.env}"
    Team    = "${local.team}"
    Service = "${local.service}"
  }
}
