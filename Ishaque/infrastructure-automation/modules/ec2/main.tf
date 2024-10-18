resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  #  depends_on = [module.vpc]

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
  }
}

