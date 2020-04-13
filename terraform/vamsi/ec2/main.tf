provider "aws" {}
module "ec2" {
  source                = "../../../modules/ec2"
  ec2_instance_names    = ["vamsi001awsd"]
  ec2_instance_count    = "1"
  env                   = "sandbox"
  app_code              = "bommasani"
  ami                   = "ami-097834fcb3081f51a"
  instance_type         = "t2.micro"
  vpc_id                = "vpc-e095698b"
  subnet_ids            = ["subnet-0491c37e"]
  availability_zones    = ["us-east-2a","us-east-2b"]
  ec2_mac_cidrs   	    = ["127.0.0.1/32","192.168.0.6/32"]
  ec2_vpc_cidrs         = ["172.31.0.0/16"]
}