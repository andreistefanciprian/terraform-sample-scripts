//Assign public ip to EC2 instance
resource "aws_eip" "pub_address" {
  instance = "${aws_instance.linux.id}"
}
