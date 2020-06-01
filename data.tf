data "aws_vpc" "selected" {
  tags = {
    ManagedBy = "terraform"
    Env       = "${local.env == "prod" ? "prod" : "staging"}"
  }
}

data "aws_ami" "fcos" {
  most_recent = true
  owners      = ["125523088429"]

  filter {
    name   = "name"
    values = ["fedora-coreos-31*"]
  }

  filter {
    name   = "description"
    values = ["Fedora CoreOS stable 31*"]
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    Team       = "shared"
    SubnetType = "public"
  }
}
