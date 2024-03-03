resource "aws_security_group" "ec2_sg"{
    name = "ec2_sg"
    description = "security EC2"
    vpc_id = aws_vpc.devops.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.internet_cidr]
    }
    
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = [var.internet_cidr]
    }
    tags = {
        Name = "EC2 Security Group"
    }
}

resource "aws_security_group" "rds_sg"{
    name = "rds_sg"
    description = "security rds"
    vpc_id = aws_vpc.devops.id

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks     = [var.vpc_cidr]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = [var.internet_cidr]
    }
    tags = {
        Name = "RDS Security Group"
    }
}
