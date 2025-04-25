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
 module "apps" {
    source = "./module/ec2"

    for_each      = var.apps
   name          = each.key
   instance_type = each.value["instance_type"]
   allow_port    = each.value["allow_port"]
   allow_sg_cidr = each.value["allow_sg_cidr"]
   subnets_ids   = module.vpc.subnets_ids[each.value["subnet_ref"]]
   capacity      = each.value["capacity"]
   vpc_id        = module.vpc.vpc_id
   env           = var.env
   bastion_nodes = var.bastion_nodes
   vault_token    = var.vault_token
   asg          = true
 }

 module "db" {
    source = "./module/ec2"

    for_each      = var.db
   name          = each.key
   instance_type = each.value["instance_type"]
   allow_port    = each.value["allow_port"]
   allow_sg_cidr = each.value["allow_sg_cidr"]
   subnets_ids   = module.vpc.subnets_ids[each.value["subnet_ref"]]
   vpc_id        = module.vpc.vpc_id
   env           = var.env
   bastion_nodes = var.bastion_nodes
   vault_token    = var.vault_token
   asg          = false
 }

   