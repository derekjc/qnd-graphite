locals {
  env                 = "${lower(var.env)}"
  team                = "${lower(var.team)}"
  service             = "${lower(var.service)}"
  resource_identifier = "${local.env}-${local.team}-${local.service}"
}
