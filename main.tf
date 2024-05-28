locals {
  network_config          = yamldecode(file("${path.module}/config/${var.network_yaml_file}"))
  network   = local.network_config.network
}


module "landingzone" {
  source  = "app.terraform.io/tfc-demo-au/landingzone/aws"
  version = "0.0.1"
  
  region = local.network.region
  availability_zones = local.network.availability_zones
  deployment_name = local.network.deployment_name
  vpc_cidr = local.network.vpc_cidr
  public_subnets = local.network.public_subnets
  private_subnets = local.network.private_subnets
  enable_http_access = local.network.enable_http_access
  enable_vpc = local.network.enable_vpc
  enable_tgw = local.network.enable_tgw
}

