#variable "" { default = "" }

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-f4f21593"
}

variable "key_name" {
  default = "cips-public-key"
}

variable "sec_group_name" {
  default = "allow-http-ssh-rule"
}

variable "instance_name" {
  default = "ubuntu-machine"
}

variable "mypubkey" {}


