module "alb" {
 source            = "./modules/alb"
 alb_name          = "threatcomposer-alb"
 security_group_id = module.vpc.security_group_id                  # Output from VPC module
 subnet_ids        = [module.vpc.subnet_a_id, module.vpc.subnet_b_id] # Output from VPC module
 vpc_id            = module.vpc.vpc_id    
 target_group      = module.alb.target_group_arn                    # Output from VPC module
}




module "ecs" {
 source            = "./modules/ecs"
 security_group_id = module.vpc.security_group_id                  # Output from VPC module
 subnet_ids        = [module.vpc.subnet_a_id, module.vpc.subnet_b_id] # Output from VPC module
 target_group_id    = module.alb.target_group_id
 target_group_arn = module.alb.target_group_arn
 alb_listener_arn = module.alb.alb_listener  
 https_lb_listener   = module.alb.https_listener              # Output from ALB module                 
 }


module "route53" {
 source = "./modules/route53"
 a_record_name = "osmanthreatcomposerapp.com"
 alb_dns_name = module.alb.alb_dns_name #output from alb
}




module "vpc" {
 source = "./modules/vpc"
}
