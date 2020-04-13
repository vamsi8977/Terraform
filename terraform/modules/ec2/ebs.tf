resource "aws_ebs_volume" "data_ebs" {
  count = "${var.ec2_instance_count}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  size              = "10"
  type              = "gp2"
  encrypted         = "true"

  tags = "${merge(local.common_tags, local.backup_tags, map(
    "Name", "${element(var.ec2_instance_names, count.index)}",
  ))}"
}

resource "aws_volume_attachment" "attach_data_ebs" {
  count       = "${var.ec2_instance_count}"
  device_name = "/dev/sdc"
  volume_id   = "${element(aws_ebs_volume.data_ebs.*.id, count.index)}"
  instance_id = "${element(aws_instance.bvk_ec2_instance.*.id, count.index)}"
}
