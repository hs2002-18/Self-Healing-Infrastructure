provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "self_healing_key"{
    key_name = var.key_name
    public_key  = var.public_key
}

resource "aws_security_group" "self_healing_sg"{
    name = "self-healing-sg"
    description = "SG for this project"
    
    ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow App (Flask)"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "self_healing_instance"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.self_healing_key.key_name
    vpc_security_group_ids = [aws_security_group.self_healing_sg.id]

    user_data = file("${path.module}/setup.sh")
}