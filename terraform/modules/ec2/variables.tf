variable "vpc_id" {
  description = "The ID of the VPC in which to create the instance."
  default     = ""
}
variable "subnet_ids" {
  description = "The ID of the subnet in which to create the instance into.  A subnet is a range of IP addresses in your VPC that can be used to isolate different EC2 resources from each other or from the Internet. Each subnet resides in one Availability Zone."
  default     = ""
}
variable "availability_zones" {
  description = "availability zone where the ec2 instance is deployed."
  default     = ""
}
variable "ec2_instance_count" {
  description = "ec2_instance_count"
  default     = "1"
}
variable "ec2_instance_names" {
  description = "Each EC2 server that is used in AWS accounts should be named with the following pattern"
  default     = ""
}
variable "ec2_vpc_cidrs" {
  description = "Allows connection from Jenkins to ec2 servers"
  default     = ""
}
variable "env" {
  description = "Name of environment"
  default     = ""
}
variable "app_code" {
  description = "three character app code"
  default     = "bommasani"
}
variable "instance_type" {
  description = "The type of instance determines your instance's CPU capacity, memory, and storage (e.g., m1.small, c1.xlarge)"
  default     = ""
}
variable "ec2_mac_cidrs" {
  description = "Allows alb to app servers"
  default     = ""
}
variable "ami" {
  description = "select ami"
  default     = ""
}