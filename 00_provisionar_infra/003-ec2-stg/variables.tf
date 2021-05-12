

#############
# Variables #
#############

# Global #
      
variable "account_id"		      { default = "788631756830" }
variable "aws_region"		      { default = "us-east-1" }
variable "profile"            { default = "k8s"}
variable "av_zone_a"          { default = "us-east-1a"}  
variable "av_zone_d"          { default = "us-east-1d"}  
variable "instance"           { default = "t3.medium"}        
variable "keyname"            { default = "k8saws"}    
variable "volumetype"         { default = "gp2"}        
variable "tags"               {
                              type = "map"
                              default = {
                                "CC" = "k8spix"
                                "Application" = "k8spix"
                                "Environment" = "sandbox"
                              }
                              }
variable "sg"                 {
                                  type = "list"
                                  default = ["sg-0c184a00388d0d811", "sg-04b7ba0791670031f"] 
                              }
