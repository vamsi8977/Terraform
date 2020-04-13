resource "aws_instance" "bvk_ec2_instance" {
  count                  = "${var.ec2_instance_count}"
  ami                    = "${var.ami}"
  env                    = "${var.env}"
  app_code               = "${var.app_code}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ec_sg.id}"]
  subnet_id              = "${element(var.subnet_ids, count.index)}"
  user_data              = "${element(data.template_file.user_data.*.rendered, count.index)}"
}

data "template_file" "user_data" {
  count    = "${var.ec2_instance_count}"
  template = "${file("${path.module}/templates/userdata.tpl")}"

  vars = {
    host_name  = "${element(var.ec2_instance_names, count.index)}"
    app_code  = "${var.app_code}"
    env       = "${var.env}"
  }
}

