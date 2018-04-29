// Configure the AWS Provider
# aws credentials have to be defined as environment variables so we don't expose them in git (eg: export TF_VAR_aws_access_key=accesskeyhere)
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-2"
}
