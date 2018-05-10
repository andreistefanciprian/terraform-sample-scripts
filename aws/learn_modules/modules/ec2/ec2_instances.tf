//Create EC2 instances
resource "aws_instance" "linux" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  tags {
    Name = "${var.instance_name}"
  }

  security_groups = ["${aws_security_group.allow_traffic.name}"]

/*
# provisioners configured for ubuntu
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
    command = "echo ${aws_instance.linux.public_ip} >> ip_addresses.txt"
  }

  provisioner "file" {
    source      = "ip_addresses.txt"
    destination = "~/ip_addresses_copy.txt"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
*/

}


