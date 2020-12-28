
resource "aws_s3_bucket" "kkbucket" {
     bucket     = var.s3-bucket-name
     acl        = "private"

     versioning {
         enabled = true
     }
    
    force_destroy = true

     server_side_encryption_configuration {
         rule {
             apply_server_side_encryption_by_default {
                 sse_algorithm = "AES256"
             }
         }
     }
}

    

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.kkbucket.id

  block_public_acls         = true
  block_public_policy       = true
  ignore_public_acls        = true
  restrict_public_buckets   = true
}

     


