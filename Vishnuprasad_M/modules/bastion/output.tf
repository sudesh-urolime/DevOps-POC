output "public_key" {
  value     = tls_private_key.bastion_ssh_key.public_key_openssh
  sensitive = true
}

output "private_key" {
  value     = tls_private_key.bastion_ssh_key.private_key_pem
  description = "This is sensitive and should be handled with extreme caution."
  sensitive = true
}

output "private_key_path" {
  value     = "${path.module}/bastion_ssh_key.pem"
  description = "Path to the private key file."
  sensitive = true
}

output "public_key_path" {
  value     = "${path.module}/bastion_ssh_key.pub"
  description = "Path to the public key file."
}