########################### AMI IDs for EC2 Instances (Bastion, Web and DB Servers) #############################
# AMI ID for Bastion/Jump-Box Server
variable "ami-id-bastion" {
    default = "ami-02e44367276fe7adc"
}

# AMI ID for Web Servers
variable "ami-id-web" {
    default = "ami-02e44367276fe7adc"
}

# AMI ID for Database Servers
variable "ami-id-db" {
    default = "ami-02e44367276fe7adc"
}



########################### Instance Types for EC2 Instances (Bastion, Web and DB Servers) #############################
# Instance Type for Web Servers
variable "instance-type-bastion" {
    default = "t2.micro"
}

# Instance Type for Web Servers
variable "instance-type-web" {
    default = "t2.micro"
}

# Instance Type for DB Servers
variable "instance-type-db" {
    default = "t2.micro"
}

########################### Key-Name for EC2 Instances (Bastion, Web and DB Servers) #############################
# Key-Name for Launching EC2 Instances
variable "key-name" {
    default = "kapilKP"
}

########################### EC2 Instances (Bastion, Web and DB Servers) Tags #####################################
# Bastion Server Tag
variable "bastion-ec2-tag" {
    default = "kapil-bastion"
}

# Web Server 1a Tag
variable "web1a-ec2-tag" {
    default = "kapil-web-1a"
}

# Web Server 1b Tag
variable "web1b-ec2-tag" {
    default = "kapil-web-1b"
}

# Database Server 1a Tag
variable "db1a-ec2-tag" {
    default = "kapil-db-1a"
}

# Database Server 1b Tag
variable "db1b-ec2-tag" {
    default = "kapil-db-1b"
}

#########################################################################################

variable "public-1a" {}

variable "public-1b" {}

variable "private-1a" {}

variable "private-1b" {}

variable "sgforbastion" {}

variable "sgforweb" {}

variable "sgfordb" {}

#variable "vpcid" {}



















