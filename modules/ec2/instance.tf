
resource "aws_instance" "bastion" {
    ami                     = var.ami-id-bastion
    instance_type           = var.instance-type-bastion
    subnet_id               = var.public-1a
    vpc_security_group_ids  = [var.sgforbastion]
    key_name                = var.key-name
    
    tags = {
      Name                  = var.bastion-ec2-tag
    }
}
    

resource "aws_instance" "web1a" {
    ami                     = var.ami-id-web
    instance_type           = var.instance-type-web
    subnet_id               = var.public-1a
    vpc_security_group_ids  = [var.sgforweb]
    user_data               = file("webserver-script-logfiles.sh")
    key_name                = var.key-name

    tags = {
      Name                  = var.web1a-ec2-tag
    }
}


resource "aws_instance" "web1b" {
    ami                     = var.ami-id-web
    instance_type           = var.instance-type-web
    subnet_id               = var.public-1b
    vpc_security_group_ids  = [var.sgforweb]
    user_data               = file("webserver-script-images.sh")
    key_name                = var.key-name

    tags = {
      Name                  = var.web1b-ec2-tag
    }
}

resource "aws_instance" "db1a" {
    ami                     = var.ami-id-db
    instance_type           = var.instance-type-db
    subnet_id               = var.private-1a
    vpc_security_group_ids  =   [var.sgfordb]
    key_name                = var.key-name

    tags = {
      Name                  = var.db1a-ec2-tag
    }
}

resource "aws_instance" "db1b" {
    ami                     = var.ami-id-db
    instance_type           = var.instance-type-db
    subnet_id               = var.private-1b
    vpc_security_group_ids  = [var.sgfordb]
    key_name                = var.key-name

    tags = {
      Name                  = var.db1b-ec2-tag
    }
}