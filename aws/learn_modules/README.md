# Create an instance in AWS

Sample terraform scripts provided for generating:
- EC2 instance with NGINX installed
- security group to allow http, ssh and download of packages
- local id_rsa.pub uploaded to aws and associated with the EC2 instance
- all of the above are imported in main terraform project as a module

## Prerequisites

Terraform installed

Aws credentials defined as environment variables:
```
export TF_VAR_aws_access_key=<AWS_ACCESS_KEY_GOES_HERE>
export TF_VAR_aws_secret_key=<AWS_SECRET_KEY_GOES_HERE>
```
SSH id_rsa.pub defined as environment variable:
```
export TF_VAR_mypubkey=$(cat ~/.ssh/id_rsa.pub)
```

### Getting it done

```
cd projects/a
terraform init
terraform plan # Check resources that are about to be created
terraform apply -auto-approve # Create aws resources
terraform apply -auto-approve # Destroy as resources
```
