variable "regions" {
  description = "The AWS region to deploy resources in"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "Cidr block for VPC"
}

variable "publicsub_cidr" {
  description = "Cidr block for public subnet"
}

variable "privatesub_cidr" {
  description = "Cidr block for private subnet"
}

variable "rdsprivatesub_cidr" {
  description = "Cidr block for rds private subnet"
}

variable "internet_cidr" {
  description = "cidr block to connect internet"
}
variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch"
}

variable "key" {
  description = "The name of the key pair to use for the EC2 instance"
}

variable "db_engine" {
  description = "The database engine for RDS instance"
}

variable "db_instance_type" {
  description = "The instance type for RDS instance"
}

variable "db_user" {
  description = "The username for the database"
}

variable "db_pass" {
  description = "The password for the database"
}
