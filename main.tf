module "vpc" {
    source = "./module/vpc"
    
    cidr    = var.vpc["cidr"]
    env     = var.env

}