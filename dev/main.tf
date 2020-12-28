terraform {
   backend "s3" {
      bucket         = "kapil-terraform-remote-backend-bucket-2020"
      key            = "global/s3/terraform.tfstate"
      region         = "ca-central-1"
      
      dynamodb_table = "terraform-up-and-running-locks"
      encrypt        = true
   }
}


provider "aws" {
     region = var.region
}


variable "region" {}
variable "vpc-cidr" {}
variable "tenancy" {}
variable "vpc-tag" {}
variable "igw-tag" {}
variable "nat-tag" {}
variable "sub-pub-1a-cidr" {}
variable "sub-pub-1b-cidr" {}
variable "sub-pri-1a-cidr" {}
variable "sub-pri-1b-cidr" {}
variable "sub-pub-1a-tag" {}
variable "sub-pub-1b-tag" {}
variable "sub-pri-1a-tag" {}
variable "sub-pri-1b-tag" {}
variable "az-pub-1a" {}
variable "az-pub-1b" {}
variable "az-pri-1a" {}
variable "az-pri-1b" {}
variable "public-rt-tag" {}
variable "private-rt-tag" {}

module "vpc" {
    source           = "../modules/vpc"
    vpc_id           = module.vpc.vpc_id
    eip-id           = module.eip.eip_id
    region           = var.region 
    vpc-cidr         = var.vpc-cidr
    tenancy          = var.tenancy
    vpc-tag          = var.vpc-tag
    igw-tag          = var.igw-tag
    nat-tag          = var.nat-tag
    sub-pub-1a-cidr  = var.sub-pub-1a-cidr
    sub-pub-1b-cidr  = var.sub-pub-1b-cidr
    sub-pri-1a-cidr  = var.sub-pri-1a-cidr
    sub-pri-1b-cidr  = var.sub-pri-1b-cidr
    sub-pub-1a-tag   = var.sub-pub-1a-tag
    sub-pub-1b-tag   = var.sub-pub-1b-tag
    sub-pri-1a-tag   = var.sub-pri-1a-tag
    sub-pri-1b-tag   = var.sub-pri-1b-tag
    az-pub-1a        = var.az-pub-1a
    az-pub-1b        = var.az-pub-1b
    az-pri-1a        = var.az-pri-1a
    az-pri-1b        = var.az-pri-1b
    public-rt-tag    = var.public-rt-tag
    private-rt-tag   = var.private-rt-tag
}


variable "your-ip" {}
variable "kapil-sg-bastion" {}
variable "kapil-sg-web" {}
variable "kapil-sg-db" {}
variable "kapil-sg-alb" {}

module "sg" {
   source            = "../modules/sg"
   vpc-id            = module.vpc.vpc_id
   your-ip           = var.your-ip
   kapil-sg-bastion  = var.kapil-sg-bastion
   kapil-sg-web      = var.kapil-sg-web
   kapil-sg-db       = var.kapil-sg-db
   kapil-sg-alb      = var.kapil-sg-alb
}

variable "eip-tag" {}

module "eip" {
   source = "../modules/eip"
}

variable "ami-id-bastion" {}
variable "ami-id-web" {}
variable "ami-id-db" {}
variable "instance-type-bastion" {}
variable "instance-type-web" {}
variable "instance-type-db" {}
variable "key-name" {}
variable "bastion-ec2-tag" {}
variable "web1a-ec2-tag" {}
variable "web1b-ec2-tag" {}
variable "db1a-ec2-tag" {}
variable "db1b-ec2-tag" {}

module "ec2" {
   source         = "../modules/ec2"
   public-1a      = module.vpc.public-1a
   public-1b      = module.vpc.public-1b
   private-1a     = module.vpc.private-1a
   private-1b     = module.vpc.private-1b
   sgforbastion   = module.sg.bastion_sg
   sgforweb       = module.sg.web_sg 
   sgfordb        = module.sg.db_sg
}

variable "alb-tag" {}
variable "tg1-tag" {}
variable "tg2-tag" {}

module "my_alb" {
   source                  = "../modules/alb"
   public-1a               = module.vpc.public-1a
   alb_vpc_id              = module.vpc.vpc_id
   alb_sg                  = module.sg.alb_sg
   subnet1a_public         = module.vpc.public-1a
   subnet1b_public         = module.vpc.public-1b
   instanceattachment1_id  = module.ec2.web_1a_id
   instanceattachment2_id  = module.ec2.web_1b_id
   alb-tag                 = var.alb-tag
   tg1-tag                 = var.tg1-tag
   tg2-tag                 = var.tg2-tag
}