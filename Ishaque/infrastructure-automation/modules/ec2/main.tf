resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  #  depends_on = [module.vpc]
  vpc_security_group_ids = var.security_groups

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
  }
}

