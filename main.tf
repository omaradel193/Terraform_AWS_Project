module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source      = "./modules/security_groups"
  vpc_id      = module.vpc.vpc_id
}

module "rds" {
  source              = "./modules/rds"
  private_subnet_id   = module.vpc.private_subnet_id
  public_subnet_id1   = module.vpc.public_subnet1
  rds_sg_id           = module.security_groups.rds_sg_id
  mysql_user          = var.mysql_user
  mysql_password      = var.mysql_password
  mysql_db            = var.mysql_db
}

module "ec2" {
  source              = "./modules/ec2"
  public_subnet_id1    = module.vpc.public_subnet1
  public_subnet_id2    = module.vpc.public_subnet2
  web_sg_id           = module.security_groups.web_sg_id
  mysql_user          = var.mysql_user
  mysql_password      = var.mysql_password
  mysql_db            = var.mysql_db
  mysql_host          = module.rds.rds_address
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  public_subnet_id1    = module.vpc.public_subnet1
  public_subnet_id2    = module.vpc.public_subnet2
  web_sg_id           = module.security_groups.web_sg_id
  vpc_id      = module.vpc.vpc_id
  web_instance_id_0  = module.ec2.web_instance_id_0
  web_instance_id_1 =  module.ec2.web_instance_id_1 
}