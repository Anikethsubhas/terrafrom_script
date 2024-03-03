resource "aws_instance" "web_app" {
  ami                    = var.ami
  instance_type          = var.ec2_instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.PrivateSub.id 
  count                  = 1
  tags = {
    Name = "web-app"
  }
}

resource "aws_ec2_instance_connect_endpoint" "connect_ec2" {
  subnet_id = aws_subnet.PrivateSub.id
  security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "ec2 connect endpoint"
  }
}