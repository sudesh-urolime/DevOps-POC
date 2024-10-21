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
  depends_on      = [module.vpc]
  security_groups = [module.security-groups.ec2_sec_grp]
}

module "iam" {
  source                  = "../../modules/iam"
  ecs_task_execution_role = "ecsTaskExecutionRole"
}

module "route53" {
  source      = "../../modules/route53"
  domain_name = "dopeops.cloud"
}

module "certs" {
  source      = "../../modules/certs"
  domain_name = "dopeops.cloud"
  environment = "prod"
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

