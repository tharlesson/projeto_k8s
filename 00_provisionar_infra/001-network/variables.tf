

#############
# Variables #
#############

# Global #

variable "env"		        { default = "network" }
variable "account_id"		{ default = "091509198395" }
variable "aws_region"		{ default = "us-east-1" }
variable "aws_access_key"	{ default = "" }
variable "aws_secret_key"	{ default = "" }
variable "profile"          { default = "personal"}
variable "cert_arn"         { default = ""}


# VPC #

variable "vpc" {
    default = {
        Name        = "k8s-vpc"
        cidr_block  = "10.190.0.0/16"
    }
}





