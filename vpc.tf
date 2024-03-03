resource "aws_vpc" "devops"{
    cidr_block = var.vpc_cidr
    tags = {
        Name = "devops VPC"
    }
}

resource "aws_subnet" "PublicSub"{
    vpc_id = aws_vpc.devops.id
    cidr_block = var.publicsub_cidr
    availability_zone = "ap-south-1a"
    

    tags = {
        Name = "Public Subnet"
    }
}

resource "aws_subnet" "PrivateSub"{
    vpc_id = aws_vpc.devops.id
    cidr_block = var.privatesub_cidr
    availability_zone = "ap-south-1a"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_subnet" "rds-privatesub"{
    vpc_id = aws_vpc.devops.id
    cidr_block = var.rdsprivatesub_cidr
    availability_zone = "ap-south-1b"
    
    tags = {
        Name = "RDS-Private Subnet"
    }
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.devops.id

    tags = {
        Name = "devops IGW"
    }
}

resource "aws_route_table" "PublicRt"{
     vpc_id = aws_vpc.devops.id
    route {        
         cidr_block = var.internet_cidr
         gateway_id = aws_internet_gateway.igw.id
     }
   tags = {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.PublicSub.id
    route_table_id = aws_route_table.PublicRt.id
}

resource "aws_eip" "NATip" {
  domain = "vpc"
  tags = {
    Name = "NAT IP Address"
  }
}


resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.NATip.id
    subnet_id = aws_subnet.PublicSub.id

    tags = {
        Name = "devops NAT Gateway"
    }
}

resource "aws_route_table" "PrivateRt"{
    vpc_id = aws_vpc.devops.id
    
    route {
        cidr_block = var.internet_cidr
        gateway_id = aws_nat_gateway.nat.id
    }
    tags = {
        Name = "Private Route Table"
    }
}

resource "aws_route_table_association" "private"{
    subnet_id = aws_subnet.PrivateSub.id
    route_table_id = aws_route_table.PrivateRt.id
}

