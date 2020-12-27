
resource "aws_vpc" "terraformvpc" {
    cidr_block = var.vpc-cidr
    #tenancy = var.tenancy

    tags = {
       Name = var.vpc-tag
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraformvpc.id

    tags = {
      Name = var.igw-tag
    }
}


resource "aws_nat_gateway" "nat" {
     subnet_id = aws_subnet.public1a.id
     allocation_id = var.eip-id

     tags = {
       Name = var.nat-tag
     }
}


resource "aws_subnet" "public1a" {
    vpc_id = aws_vpc.terraformvpc.id 
    cidr_block = var.sub-pub-1a-cidr
    availability_zone_id = var.az-pub-1a
    map_public_ip_on_launch = true

    tags = {
      Name = var.sub-pub-1a-tag
    }
}


resource "aws_subnet" "public1b" {
    vpc_id = aws_vpc.terraformvpc.id 
    cidr_block = var.sub-pub-1b-cidr
    availability_zone_id = var.az-pub-1b
    map_public_ip_on_launch = true

    tags = {
      Name = var.sub-pub-1b-tag
    }
}


resource "aws_subnet" "private1a" {
    vpc_id = aws_vpc.terraformvpc.id 
    cidr_block = var.sub-pri-1a-cidr
    availability_zone_id = var.az-pri-1a
    map_public_ip_on_launch = false

    tags = {
      Name = var.sub-pri-1a-tag
    }
}


resource "aws_subnet" "private1b" {
    vpc_id = aws_vpc.terraformvpc.id 
    cidr_block = var.sub-pri-1b-cidr
    availability_zone_id = var.az-pri-1b
    map_public_ip_on_launch = false

    tags = {
      Name = var.sub-pri-1b-tag
    }
}


resource "aws_route_table" "publicrt" {
   vpc_id = aws_vpc.terraformvpc.id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.igw.id
   }

   tags = {
     Name = var.public-rt-tag
   }
}


resource "aws_route_table" "privatert" {
   vpc_id = aws_vpc.terraformvpc.id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.nat.id
   }

   tags = {
     Name = var.private-rt-tag
    }
}



resource "aws_route_table_association" "rta1" {
   subnet_id = aws_subnet.public1a.id
   route_table_id = aws_route_table.publicrt.id
}
   

resource "aws_route_table_association" "rta2" {
   subnet_id = aws_subnet.public1b.id
   route_table_id = aws_route_table.publicrt.id
}


resource "aws_route_table_association" "rta3" {
   subnet_id = aws_subnet.private1a.id
   route_table_id = aws_route_table.privatert.id
}


resource "aws_route_table_association" "rta4" {
   subnet_id = aws_subnet.private1b.id
   route_table_id = aws_route_table.privatert.id
}