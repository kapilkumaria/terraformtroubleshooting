provider "aws" {
    region = "ca-central-1"
}


#variable "dynamodb-table-tag" {}


module "my_s3" {
   source = "../../modules/s3"
}

module "my_dynamodb" {
   source = "../../modules/dynamodb"
   #dynamodb-table-tag = var.dynamodb-table-tag
}

