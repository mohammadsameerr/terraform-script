

resource "aws_route53_zone" "dev" {
  name = "dev.com"

  tags = {
    Environment = "dev"
  }
}