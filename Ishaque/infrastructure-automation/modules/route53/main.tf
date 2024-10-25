# Creating the DNS zone to manage the domain
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# Creating an alias record to point our domain to the loadbalancer
resource "aws_route53_record" "main_domain" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.r53_alb_dns_name
    zone_id                = var.r53_alb_zone_id
    evaluate_target_health = true
  }
}
