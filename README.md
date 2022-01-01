# EKS deployment:

## 🤷🏼‍️ PREREQUISITE

First clone this repo, and then install:

- ✅ Terraform
- ✅ aws-cli
- ✅ helm

## Config aws-cli:

First please create an IAM account and add then configure aws-cli to use this IAM account by running:

```sh
aws configure
```

## EKS 🔌:

### Installing EKS 🔥 :

Firt you will have to download all the moduls terraform uses in this repo, please run `init` command:

```
terraform init
```

Next step is to deploy the EKS cluster

```
terraform apply
```

This will deploy/update the EKS components in the AWS.

### Uninstalling the EKS :

```
terraform destroy
```
