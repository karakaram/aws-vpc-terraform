# aws-vpc-terraform

This repository contains a Terraform script to creates an Amazon VPC.

## Requirement

- [Terraform](https://www.terraform.io/downloads.html)
- [tfenv](https://github.com/tfutils/tfenv)

## Usage

Create S3 Bucket to store tfstate.

```
aws s3api create-bucket --bucket tfstate --region ap-northeast-1 --create-bucket-configuration LocationConstraint=ap-northeast-1
```

Create resources.

```
terraform init
terraform workspace new dev
terraform workspace select dev
terraform plan -var-file=dev.tfvars
```
