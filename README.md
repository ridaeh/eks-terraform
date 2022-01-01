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

### Connect kubectl to the cluster 🔌

The following command will configure the local kubectl to connect to the eks cluster.

```
aws eks --region us-east-2 update-kubeconfig --name  my-cluster
```

### Uninstalling the EKS :

```
terraform destroy
```

## Redis:

### Installing the cluster 🔥 :

To deploy the redis cluster to the EKS we will use the redis-cluster chart: https://github.com/bitnami/charts/tree/master/bitnami/redis

```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm install redis-cluster bitnami/redis
```

### Check the cluster:

Checking if the Redis pod deployed in the previous step is running.

```
helm list
```

To check the running pods:

```
kubectl get pod
```

Enter the created pod with kubectl exec.

```
kubectl exec -it redis-cluster-master-0  -- redis-cli
```

### Uninstalling the cluster :

To uninstall/delete the redis-cluster deployment:

```
$ helm delete redis-cluster
```

The above command removes all the Kubernetes components associated with the chart and deletes the release.
