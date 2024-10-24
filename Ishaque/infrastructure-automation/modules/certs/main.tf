# Creating AWS managed SSL certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}


#resource "aws_acm_certificate" "example" {
#  domain_name       = "example.com"
#  validation_method = "DNS"
#}

#data "aws_route53_zone" "example" {
#  name         = "example.com"
#  private_zone = false
#}

resource "aws_route53_record" "example" {
  for_each = {
    #for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  #zone_id         = data.aws_route53_zone.example.zone_id
  zone_id = var.cert_r53_zone_id
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.example : record.fqdn]
}

#resource "aws_lb_listener" "example" {
#  # ... other configuration ...
#
#  certificate_arn = aws_acm_certificate_validation.example.certificate_arn
#}
