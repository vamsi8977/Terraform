locals {
  backup_tags {
    Tech.BackUp.Time.HourOfDay = "22"
    Tech.BackUp.Retention.Days = "07"
    Tech.BackUp.RollFlag       = "false"
  }
  common_tags {
    Tech.Env     = "${upper(var.env)}"
    Tech.AppCode = "${upper(var.app_code)}"
  }
}
variable "vpc_id" {
  description = "The ID of the VPC in which to create the instance."
}
variable "subnet_ids" {
  type        = list
  description = "The ID of the subnet in which to create the instance into.  A subnet is a range of IP addresses in your VPC that can be used to isolate different EC2 resources from each other or from the Internet. Each subnet resides in one Availability Zone."
}
variable "availability_zones" {
  type        = list
  description = "availability zone where the ec2 instance is deployed."
}
variable "ec2_instance_count" {
  description = "ec2_instance_count"
  default     = "1"
}
variable "ec2_instance_names" {
  type        = list
  description = "Each EC2 server that is used in AWS accounts should be named with the following pattern"
}
variable "ec2_vpc_cidrs" {
  type        = list
  description = "Allows connection from Jenkins to ec2 servers"
}
variable "env" {
  description = "Name of environment"
}
variable "app_code" {
  description = "three character app code"
  default     = "bommasani"
}
variable "instance_type" {
  description = "The type of instance determines your instance's CPU capacity, memory, and storage (e.g., m1.small, c1.xlarge)"
}
variable "ec2_mac_cidrs" {
  type        = "list"
  description = "Allows alb to app servers"
}
variable "ami" {
  description = "select ami"
}