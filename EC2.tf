resource "aws_instance" "web" {
  ami                    = "ami-09d3b3274b6c5d4aa"
  instance_type          = "t2.micro"
  user_data     = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.ins-sg.id]

  tags = {
    Name = "RDS_INSTANCE"
  }
}


resource "aws_security_group" "ins-sg" {
  name = "EC2-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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