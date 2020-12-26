provider "aws" {
     region = var.region
}

variable "region" {}
variable "vpc-cidr" {}
variable "tenancy" {}
variable "vpc-tag" {}
variable "igw-tag" {}
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
    source = "../modules/vpc"
    vpc_id = module.vpc.vpc_id
    eip-id = module.eip.eip_id
    region          = var.region 
    vpc-cidr        = var.vpc_cidr
    tenancy         = var.tenancy
    vpc-tag         = var.vpc-tag
    igw-tag         = var.igw-tag
    sub-pub-1a-cidr = var.sub-pub-1a-cidr
    sub-pub-1b-cidr = var.sub-pub-1b-cidr
    sub-pri-1a-cidr = var.sub-pri-1a-cidr
    sub-pri-1b-cidr = var.sub-pri-1b-cidr
    sub-pub-1a-tag  = var.sub-pub-1a-tag
    sub-pub-1b-tag  = var.sub-pub-1b-tag
    sub-pri-1a-tag  = var.sub-pri-1a-tag
    sub-pri-1b-tag  = var.sub-pri-1b-tag
    az-pub-1a       = var.az-pub-1a
    az-pub-1b       = var.az-pub-1b
    az-pri-1a       = var.az-pri-1a
    az-pri-1b       = var.az-pri-1b
    public-rt-tag   = var.public-rt-tag
    private-rt-tag  = var.private-rt-tag
}

Start from here ------>>>>>>








module "sg" {
   source = "../modules/sg"
   terravpcid = module.vpc.vpc_id
}

module "eip" {
   source = "../modules/eip"
}

module "ec2" {
   source = "../modules/ec2"
   #ec2_count = 1
   ami_id = "ami-02e44367276fe7adc"
   instance_type = "t2.micro"
   #vpc_id = module.vpc.vpc_id
   public-1a = module.vpc.public-1a
   public-1b = module.vpc.public-1b
   private-1a = module.vpc.private-1a
   private-1b = module.vpc.private-1b
   sgforbastion = module.sg.bastion_sg
   sgforweb = module.sg.web_sg 
   sgfordb = module.sg.db_sg
}

module "my_alb" {
   source = "../modules/alb"
   public-1a = module.vpc.public-1a
   alb_vpc_id = module.vpc.vpc_id
   alb_sg = module.sg.alb_sg
   subnet1a_public = module.vpc.public-1a
   subnet1b_public = module.vpc.public-1b
   instanceattachment1_id = module.ec2.web_1a_id
   instanceattachment2_id = module.ec2.web_1b_id
}

# resource "aws_instance" "myinstance" {
#    ami = "ami-02e44367276fe7adc"
#    instance_type = "t2.micro"
#    subnet_id = module.vpc.public-1a
   
#    tags = {
#       Name = "kapil_instance"
#    }
# }







