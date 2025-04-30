env = "dev"
bastion_nodes = ["172.31.29.63/32"]
zone_id = "Z03035903COPLEGQ5980F"


vpc = {
    cidr = "10.10.0.0/16"
    public_subnets = ["10.10.0.0/24" , "10.10.1.0/24"]
    web_subnets = ["10.10.2.0/24" , "10.10.3.0/24"]
    app_subnets = ["10.10.4.0/24" , "10.10.5.0/24"]
    db_subnets = ["10.10.6.0/24" , "10.10.7.0/24"]
    availability_zones = ["us-east-1a" , "us-east-1b"]
    default_vpc_id = "vpc-0b3bc4ea0b05389f7"
    default_vpc_rt = "rtb-0c6f868328545ca7b"
    default_vpc_cidr = "172.31.0.0/16"   
}

apps = {
  
  frontend = {
    subnet_ref = "web"
    instance_type = "t3.small"
    allow_port    = 80
    allow_sg_cidr = ["10.10.0.0/24", "10.10.1.0/24"]   ### public should be allowed
    allow_lb_sg_cidr = ["0.0.0.0/0"]
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }

    aws_lb_listener  = "public"
    lb_rule_priority = 1
  }

   catalogue = {
    subnet_ref = "app"
    instance_type = "t3.small"
    allow_port    = 8080
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]    ###### server security  access to app 
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]    ####load balncer security group   access to web also catalogue has to talk to fronted.
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }
    aws_lb_listener = "private"
    lb_rule_priority = 1
  }


cart = {
    subnet_ref = "app"
    instance_type = "t3.small"
    allow_port    = 8080
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]    ###### server security  access to app 
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]    ####load balncer security group   access to web
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }
    aws_lb_listener  = "private"
    lb_rule_priority = 2
  }

user = {
    subnet_ref = "app"
    instance_type = "t3.small"
    allow_port    = 8080
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]    ###### server security  access to app 
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]    ####load balncer security group   access to web
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }
    aws_lb_listener = "private"
    lb_rule_priority = 3
  }


 shipping = {
    subnet_ref = "app"
    instance_type = "t3.small"
    allow_port    = 8080
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]    ###### server security  access to app 
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]   ####load balncer security group   access to web
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }
    aws_lb_listener  ="private"
    lb_rule_priority = 4
  }

payment = {
    subnet_ref = "app"
    instance_type = "t3.small"
    allow_port    = 8080
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]    ###### server security  access to app 
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]    ####load balncer security group   access to web
    capacity = {
        desired = 1
        max     = 1
        min     = 1

    }
    aws_lb_listener  = "private"
    lb_rule_priority = 5

  }

}

db = {
    mongo = {
    subnet_ref = "db"
    instance_type = "t3.small"
    allow_port    = 27017
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]
    }
    mysql = {
    subnet_ref    = "db"
    instance_type = "t3.small"
    allow_port    = 3306
    allow_sg_cidr = ["10.10.4.0/24", "10.10.5.0/24"]
    }
    rabbitmq = {
    subnet_ref = "db"
    instance_type = "t3.small"
    allow_port    = 5672
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]
    }
    redis = {
    subnet_ref = "db"
    instance_type = "t3.small"
    allow_port    = 6379
    allow_sg_cidr = ["10.10.4.0/24" , "10.10.5.0/24"]
    }

}

load_balancers = {
  private = {
    internal    = true
    load_balancer_type  = "application"
    allow_lb_sg_cidr = ["10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]    ####load balncer security group   access to web
    subnet_ref   = "app"
    acm_https_arn = null
    listener_port              = "80"
    listner_protocol          = "HTTP"
    ssl_policy        = null


  }
  public = {
     internal    = true
    load_balancer_type  = "application"
    allow_lb_sg_cidr = ["0.0.0.0/0"]
    subnet_ref    =  "public"
    acm_https_arn =  "arn:aws:acm:us-east-1:640168456211:certificate/2bae4e22-20ac-4210-900a-dcade7759795"
    listener_port              = "443"
    listner_protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
  
  }

}





