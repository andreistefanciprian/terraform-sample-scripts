// Configure the AWS Provider
// AWS credentials defined as environment variables (eg: export TF_VAR_aws_access_key=accesskeyhere, export TF_VAR_aws_secret_key=accesskeyhere)

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.my_region}"
}
