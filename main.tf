# Create a VPC
resource "aws_vpc" "rds-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
  }
}


# Create a subnet group
resource "aws_subnet" "subnet" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.rds-vpc.id
}

# Create a security group
resource "aws_security_group" "security-group" {
  name_prefix = "security-sg"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_db_instance" "fastfood" {
  allocated_storage   = 20
  storage_type        = "gp2"
  identifier          = "fastfood"
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = "db.t3.micro"
  db_name             = "fastfood"
  username            = "fastfooduser"
  password            = "fastfoodpass"
  port                = 5432
  publicly_accessible = true
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.security-group.id]
  tags = {
    Name = "fastfoodrds"
  }
}
