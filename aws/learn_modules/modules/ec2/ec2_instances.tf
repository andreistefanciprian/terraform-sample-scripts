//Create EC2 instances
resource "aws_instance" "ubuntu" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  tags {
    Name = "${var.instance_name}"
  }

  security_groups = ["${aws_security_group.allow_traffic.name}"]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install epel-release",
      "sudo apt-get -y install nginx",
      "sudo echo aaaaaa > test.txt",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ubuntu.public_ip} >> ip_addresses.txt"
  }

  provisioner "file" {
    source      = "ip_addresses.txt"
    destination = "/home/ubuntu/ip_addresses_copy.txt"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
}


