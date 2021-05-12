###############################################################################
# backend para armazenar tfstate no s3
# obs: nao suporta interpolacao de variaveis
##############################################################################
terraform {
  backend "s3" {
    bucket = "cluster-k8s-callink"
    key = "aws-inf-shared/ec2-k8s.tf"
    region = "us-east-1"
  }
} 
