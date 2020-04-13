# AWS App Security Group
resource "aws_security_group" "ec_sg" {
  name        = "${var.app_code}-${var.env}-ec-sg"
  description = "${var.app_code} app server security group"
  vpc_id      = "${var.vpc_id}"
}
resource "aws_security_group_rule" "mac_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = "${var.ec2_mac_cidrs}"
  security_group_id = "${aws_security_group.ec_sg.id}"
  description       = "Allow inbound to ec2"
}
resource "aws_security_group_rule" "mac_egress" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = "${var.ec2_mac_cidrs}"
  security_group_id = "${aws_security_group.ec_sg.id}"
  description       = "Allow outbound to ec2"
}
resource "aws_security_group_rule" "vpc_ingress" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = "${var.ec2_vpc_cidrs}"
  description = "Allow vpc inbound to ec2"
  security_group_id = "${aws_security_group.ec_sg.id}"
}
resource "aws_security_group_rule" "vpc_egress" {
  type        = "egress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = "${var.ec2_vpc_cidrs}"
  description = "Allow vpc outbound to ec2"
  security_group_id = "${aws_security_group.ec_sg.id}"
}
resource "aws_security_group_rule" "all_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec_sg.id}"
  description       = "Allow all to ec2"
}
resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec_sg.id}"
  description       = "Allow all to ec2"
}