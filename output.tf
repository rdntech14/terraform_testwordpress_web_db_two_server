output "instance_url" {
  value = "${aws_instance.ec2_web.public_dns}"
}

output "ec2_db_ip" {
  value = "${aws_instance.ec2_db.public_ip}"
}

output "ec2_db_private_ip" {
  value = "${aws_instance.ec2_db.private_ip}"
}

output "ec2_web_ip" {
  value = "${aws_instance.ec2_web.public_ip}"
}

output "ec2_web_private_ip" {
  value = "${aws_instance.ec2_web.private_ip}"
}
