env = "dev"
bastion_nodes = ["172.31.20.242/32"]

vpc ={
    cidr = "10.10.0.0/16"
    public_subnets = ["10.10.0.0/24" , "10.10.1.0/24"]
    web_subnets = ["10.10.2.0/24" , "10.10.3.0/24"]
    app_subnets = ["10.10.4.0/24" , "10.10.5.0/24"]
    db_subnets = ["10.10.6.0/24" , "10.10.7.0/24"]
    availability_zones = ["us-east-1a" , "us-east-1b"]
    vpc_default_id = "vpc-0b3bc4ea0b05389f7"
    vpc_default_rt = "rtb-0c6f868328545ca7b"
    vpc_default_cidr = "172.31.16.0/20"   
}


ec2 = {
    frontend = {
 
        instance_type = "t2.micro"
        allow_port = 80
        allow_sg_cidr = ["10.10.0.0/24" , "10.10.1.0/24"]
        subnets  = module.vpc.subnets["web"][0]
    }
}