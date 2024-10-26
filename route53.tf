resource "aws_route53_record" "vault_route53_A_record"  {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.vault_lb.dns_name
    zone_id                = aws_lb.vault_lb.zone_id
    evaluate_target_health = true
  }
  
}
