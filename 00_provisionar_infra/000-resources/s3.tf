###############################################################################
# bucket para armazenar tfstate no s3
###############################################################################

resource "aws_s3_bucket" "cluster-k8s-callink" {
    bucket  = "cluster-k8s-callink"
    acl     = "private"
    
    tags = {
        Name            = "cluster-k8s-callink"
        application     = "k8s"
        project         = "entrevista"
    }
}

#FOLDER
resource "aws_s3_bucket_object" "cluster-k8s-callink-folder" {

    bucket  = aws_s3_bucket.cluster-k8s-callink.id
    key     = "aws-inf-shared/"
    source  = "/dev/null"
}
