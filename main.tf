module "vpc" {
  source = "./module/vpc"

  cidr               = var.vpc["cidr"]
  env                = var.env
  public_subnets = var.vpc["public_subnets"]
  app_subnets = var.vpc["app_subnets"]
  web_subnets = var.vpc["web_subnets"]
  db_subnets = var.vpc["db_subnets"]
  availability_zones = var.vpc["availability_zones"]
  vpc_default_id = var.vpc["vpc_default_id"]
  vpc_default_rt = var.vpc["vpc_default_rt"]
  vpc_default_cidr = var.vpc["vpc_default_cidr"]   
}
