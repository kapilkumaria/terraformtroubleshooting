## Region in which the resources to be deployed
variable "region" {
    default = "ca-central-1"
}

# VPC CIDR Block
variable "vpc-cidr" {
    default = "192.168.0.0/26"
}

# VPC Tenancy
variable "tenancy" {
   default = "default"
}

# VPC Tag
variable "vpc-tag" {
    default = "kapil_vpc"
}

#IGW Tag
variable "igw-tag" {
    default = "kapil_igw"
}

#NAT Tag
variable "nat-tag" {
    default = "kapil_nat"
}

########################### Subnets CIDR Blocks #############################
# Public Subnet in 1a - CIDR Block
variable "sub-pub-1a-cidr" {
    default = "192.168.0.0/28"
}

# Public Subnet in 1b - CIDR Block
variable "sub-pub-1b-cidr" {
    default = "192.168.0.16/28"
}

# Private Subnet in 1a - CIDR Block
variable "sub-pri-1a-cidr" {
    default = "192.168.0.32/28"
}

# Private Subnet in 1b - CIDR Block
variable "sub-pri-1b-cidr" {
    default = "192.168.0.48/28"
}

########################### Subnets CIDR Tags #############################
# Public Subnet in 1a - Tag
variable "sub-pub-1a-tag" {
    default = "sub_pub_1a_tag"
}

# Public Subnet in 1b - Tag
variable "sub-pub-1b-tag" {
    default = "sub_pub_1b_tag"
}

# Private Subnet in 1a - Tag
variable "sub-pri-1a-tag" {
    default = "sub_pri_1a_tag"
}

# Private Subnet in 1b - Tag
variable "sub-pri-1b-tag" {
    default = "sub_pri_1b_tag"
}


########################### Subnets Availablilty Zones #############################
# Availablilty Zone for Public Subnet in 1a
variable "az-pub-1a" {
    default = "cac1-az1"
}

# Availablilty Zone for Public Subnet in 1b
variable "az-pub-1b" {
   default = "cac1-az2"
}

# Availablilty Zone for Private Subnet in 1a
variable "az-pri-1a" {
   default = "cac1-az1"
}

# Availablilty Zone for Private Subnet in 1b
variable "az-pri-1b" {
   default = "cac1-az2"
}

########################### VPC Route Tables ########################################

# Public RT Tag
variable "public-rt-tag" {
    default = "kapil-pub-rt"
}

variable "private-rt-tag" {
    default = "kapil-pri-rt"
}


##########################################################################################
variable "eip-id" {}





