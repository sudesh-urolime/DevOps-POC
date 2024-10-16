module "vpc" {
  source                     = "../../modules/vpc"
  vpc_name                   = "production-vpc"
  cidr_block                 = "10.0.0.0/16"
  environment                = "prod"
  public_subnet_count        = 2
  public_subnets_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  azs                        = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = "ami-00f251754ac5da7f0"
  instance_type = "t2.nano"
  subnet_id     = element(module.vpc.public_subnet_ids, 0)
  environment   = "prod"
}

