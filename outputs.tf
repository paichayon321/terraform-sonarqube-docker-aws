output "instance_ips" {
  value = ["${aws_instance.default.*.public_ip}"]
}

output "address" {
  value = "${aws_instance.default.private_ip}"
}

output "elastic_ip" {
  value = "${aws_eip.default.public_ip}"
}
