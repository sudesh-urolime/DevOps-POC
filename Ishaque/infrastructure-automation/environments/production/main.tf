module "vpc" {
  source                      = "../../modules/vpc"
  vpc_name                    = var.vpc_name
  cidr_block                  = var.cidr_block
  enable_dns_support          = var.enable_dns_support
  environment                 = var.environment
  public_subnet_count         = var.public_subnet_count
  private_subnet_count        = var.private_subnet_count
  public_subnets_cidr_blocks  = var.public_subnets_cidr_blocks
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  azs                         = var.azs
  map_public_ip_on_launch     = var.map_public_ip_on_launch
  igw_name                    = var.igw_name
  nat_name                    = var.nat_name
  pub_rt_name                 = var.pub_rt_name
  prvt_rt_name                = var.prvt_rt_name
}

module "ec2" {
  source          = "../../modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = element(module.vpc.public_subnet_ids, 0)
  environment     = var.environment
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
  domain_name      = var.domain_name
  r53_alb_dns_name = module.alb.alb_dns_name
  r53_alb_zone_id  = module.alb.alb_zone_id
  #depends_on       = [module.alb]
}

module "certs" {
  source      = "../../modules/certs"
  domain_name = var.domain_name
  environment = var.environment
  #depends_on       = [module.route53]
  cert_r53_zone_id = module.route53.zone_id
}

# ECR module has been disabled since it's not in use
#module "ecr" {
#  source   = "../../modules/ecr"
#  ecr_repo = "prod-ecr-repo"
#}

module "security-groups" {
  source = "../../modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "ssh-key-pairs" {
  source             = "../../modules/ssh-key-pairs"
  key_name           = var.key_name
  bastion_public_key = var.bastion_public_key
}

module "alb" {
  source                = "../../modules/alb"
  prod_pub_alb_name     = var.prod_pub_alb_name
  prod_pub_alb_sec_grps = [module.security-groups.alb_sec_grp]
  #prod_pub_alb_public_subnets_ids = module.vpc.alb_pub_sub_ids
  prod_pub_alb_public_subnets_ids = module.vpc.public_subnet_ids
  environment                     = var.environment
  tg_vpc_id                       = module.vpc.vpc_id
  tg_name                         = var.tg_name
  prod_main_domain                = var.domain_name
  alb_acm_cert_arn                = module.certs.acm_cert_arn
}

module "ecs" {
  source = "../../modules/ecs"
  #depends_on       = [module.iam, module.vpc, module.alb, module.security-groups]
  ecs_cluster_name = var.ecs_cluster_name
  environment      = var.environment
  task_def_name    = var.task_def_name
  task_cpu         = var.task_cpu
  task_mem         = var.task_mem
  #task_def_ecr_repository_url = module.ecr.ecr_repository_url
  #task_def_ecr_repository_url = "nginx"
  task_def_ecr_repository_url = var.task_def_ecr_repository_url
  ecs_execution_role_arn      = module.iam.ecs_task_execution_role_arn
  ecs_svc_name                = var.ecs_svc_name
  ecs_desired_count           = var.ecs_desired_count
  ecs_tg_arn                  = module.alb.tg_arn
  #task_container_port         = 80
  task_container_port = var.task_container_port
  #task_host_port              = 80
  task_host_port = var.task_host_port
  ecs_max_count  = var.ecs_max_count
  ecs_min_count  = var.ecs_min_count
  ecs_subnets    = module.vpc.private_subnet_ids
  ecs_sec_grps   = module.security-groups.ecs_sec_grp
}
