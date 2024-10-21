resource "aws_key_pair" "bastion_key" {
  key_name   = var.key_name
  public_key = var.bastion_public_key
}
