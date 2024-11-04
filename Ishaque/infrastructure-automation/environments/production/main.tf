module "vpc" {
  source                      = "../../modules/vpc"
  vpc_name                    = "production-vpc"
  cidr_block                  = "10.0.0.0/16"
  enable_dns_support          = "true"
  environment                 = "prod"
  public_subnet_count         = 2
  private_subnet_count        = 2
  public_subnets_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                         = ["us-east-1a", "us-east-1b"]
  map_public_ip_on_launch     = "true"
  igw_name                    = "prod-igw"
  nat_name                    = "prod-nat"
  pub_rt_name                 = "prod-public-rt"
  prvt_rt_name                = "prod-private-rt"
}

module "ec2" {
  source          = "../../modules/ec2"
  ami_id          = "ami-00f251754ac5da7f0"
  instance_type   = "t2.nano"
  subnet_id       = element(module.vpc.public_subnet_ids, 0)
  environment     = "prod"
  depends_on      = [module.vpc, module.ssh-key-pairs]
  security_groups = [module.security-groups.ec2_sec_grp]
  key_name        = module.ssh-key-pairs.bastion_key_pair
}

module "iam" {
  source                  = "../../modules/iam"
  ecs_task_execution_role = "ecsTaskExecutionRole"
}

module "route53" {
  source           = "../../modules/route53"
  domain_name      = "dopeops.cloud"
  r53_alb_dns_name = module.alb.alb_dns_name
  r53_alb_zone_id  = module.alb.alb_zone_id
  #depends_on       = [module.alb]
}

module "certs" {
  source           = "../../modules/certs"
  domain_name      = "dopeops.cloud"
  environment      = "prod"
  #depends_on       = [module.route53]
  cert_r53_zone_id = module.route53.zone_id
}

module "ecr" {
  source   = "../../modules/ecr"
  ecr_repo = "prod-ecr-repo"
}

module "security-groups" {
  source = "../../modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "ssh-key-pairs" {
  source             = "../../modules/ssh-key-pairs"
  key_name           = "prod-bastion-key"
  bastion_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHEVx/vVXrSamPAqnvbvRKOwD6rYXZT3wBfKUyYsGjgI ishaque.abdul@urolime.com"
}

module "alb" {
  source                = "../../modules/alb"
  prod_pub_alb_name     = "prod-pub-alb"
  prod_pub_alb_sec_grps = [module.security-groups.alb_sec_grp]
  #prod_pub_alb_public_subnets_ids = module.vpc.alb_pub_sub_ids
  prod_pub_alb_public_subnets_ids = module.vpc.public_subnet_ids
  environment                     = "prod"
  tg_vpc_id                       = module.vpc.vpc_id
  tg_name                         = "prod-mealie-tg"
  prod_main_domain                = "dopeops.cloud"
  alb_acm_cert_arn                = module.certs.acm_cert_arn
}

module "ecs" {
  source           = "../../modules/ecs"
  #depends_on       = [module.iam, module.vpc, module.alb, module.security-groups]
  ecs_cluster_name = "prod-mealie-cluster"
  environment      = "prod"
  task_def_name    = "prod-mealie-app"
  task_cpu         = 1024
  task_mem         = 2048
  #task_def_ecr_repository_url = module.ecr.ecr_repository_url
  #task_def_ecr_repository_url = "nginx"
  task_def_ecr_repository_url = "ghcr.io/mealie-recipes/mealie:v2.0.0"
  ecs_execution_role_arn      = module.iam.ecs_task_execution_role_arn
  ecs_svc_name                = "prod-mealie-app"
  ecs_desired_count           = 1
  ecs_tg_arn                  = module.alb.tg_arn
  #task_container_port         = 80
  task_container_port         = 9000
  #task_host_port              = 80
  task_host_port              = 9000
  ecs_max_count               = 200
  ecs_min_count               = 100
  ecs_subnets                 = module.vpc.private_subnet_ids
  ecs_sec_grps                = module.security-groups.ecs_sec_grp
}
