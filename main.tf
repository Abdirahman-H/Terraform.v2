provider "aws" {
  region = "eu-west-2"  
}


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true


    tags = {
        Name = "my_vpc"
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true


    tags = {
        Name = "public_subnet"
    }    
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "my_igw"
    }    
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public_rt"
    }    

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_security_group" "ssh_sg" {
  name        = "allow_ssh"
  description = "Allow SSH from my IP"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["86.171.222.50/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "first_instance" {
    ami =           "ami-0336cdd409ab5eec4"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.ssh_sg.id]
    associate_public_ip_address = true
    key_name = "my-keypair"

    tags = {
        Name = "first_instance"
    }
}