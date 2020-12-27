
resource "aws_s3_bucket" "kkbucket" {
     bucket = var.s3-bucket-name
     acl = "private"

     versioning {
         enabled = true
     }

     server_side_encryption_configuration {
         rule {
             apply_server_side_encryption_by_default {
                 sse_algorithm = "AES256"
             }
         }
     }
    }

    


     


