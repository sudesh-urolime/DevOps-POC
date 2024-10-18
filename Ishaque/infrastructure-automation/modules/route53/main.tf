# Creating the DNS zone to manage the domain
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

#
