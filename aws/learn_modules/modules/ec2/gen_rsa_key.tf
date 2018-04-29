//Add local pub key to aws
resource "aws_key_pair" "id_rsa_pub" {
  key_name   = "${var.key_name}"
  public_key = "${var.mypubkey}"
}
