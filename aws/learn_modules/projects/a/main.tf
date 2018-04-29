# mybupkey variable has to be defined as environment variable (eg: export TF_VAR_mypubkey=$(cat ~/.ssh/id_rsa.pub))

module "ec2inst" {
  source = "../../modules/ec2"

  #instance_type      = "t2.micro"
  #ami                = "ami-f4f21593"
  mypubkey = "${var.mypubkey}"
}
