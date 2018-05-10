// mybupkey variable defined as environment variable (eg: export TF_VAR_mypubkey=$(cat ~/.ssh/id_rsa.pub))

module "ec2inst" {
  source = "../../modules/ec2"

  #instance_type      = "t2.micro"
  ami                = "ami-7c1bfd1b"
  instance_name      = "redhat_machine"
  mypubkey = "${var.mypubkey}"
}
