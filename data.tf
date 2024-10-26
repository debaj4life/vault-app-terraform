data "aws_caller_identity" "current" {


}

data "aws_default_tags" "current" {


}

data "aws_route53_zone" "selected" {
  name = "techrite.org"
}
