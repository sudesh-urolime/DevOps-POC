output "ec2_sec_grp" {
  description = "bastion sec grp id to be used with the ec2 module"
  value = aws_security_group.bastion_sec_grp.id
}

