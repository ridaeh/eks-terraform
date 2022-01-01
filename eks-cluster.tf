data "aws_eks_cluster" "my-cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "my-cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.my-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.my-cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.my-cluster.token
  #load_config_file       = false
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "17.24.0"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

# If the instance is too small, you will not have enough available NICs to assign IP addresses to
# all the pods on your instances
   worker_groups = [
    {
      name = "worker-group-1"
      instance_type = "t2.small"
      asg_min_size = 1
      asg_desired_capacity = 1
      asg_max_size  = 3
     # additional_security_group_ids = [aws_security_group.allow-web-traffic.id]
    }
  ]
}