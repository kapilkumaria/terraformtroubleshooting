provider "aws" {
    region = "ca-central-1"
}

# resource "aws_s3_bucket" "kapil-ritu-terraform-bucket-2020" {

# }

#variable "s3-bucket-name" {}
variable "dynamodb-table-tag" {}


module "my_s3" {
   source = "../../modules/s3"
   #s3-bucket-name = var.s3-bucket-name
}

module "my_dynamodb" {
   source = "../../modules/dynamodb"
   dynamodb-table-tag = var.dynamodb-table-tag
}
