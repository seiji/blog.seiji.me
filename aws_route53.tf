variable "access_key" {
  description = "access_key to use aws api"
}

variable "secret_key" {
  description = "secret_key to use aws api"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "ap-northeast-1"
}

resource "aws_route53_zone" "seijime" {
   name = "testseiji.me"
}

resource "aws_route53_record" "blog" {
   zone_id = "${aws_route53_zone.seijime.zone_id}"
   name = "blog"
   type = "A"
   ttl = "300"
   records = ["128.199.177.77"]
}

resource "aws_route53_record" "all" {
   zone_id = "${aws_route53_zone.seijime.zone_id}"
   name = "*"
   type = "A"
   ttl = "300"
   records = ["128.199.177.77"]
}

