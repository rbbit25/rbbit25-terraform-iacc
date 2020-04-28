provider "aws" {
    region = "us-east-1"
    version = "2.59"
}


// Creates Key
resource "aws_key_pair" "us-east-1-key-output" {
  key_name   = "rbbit_bastion_output"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

// Creates Instance
resource "aws_instance" "web_output" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
   security_groups = ["${aws_security_group.allow_tls.name}"]
  }

// Creates Sec Group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
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

  tags = {
    Name = "allow_tls"
  }
}


// Creates Route53
resource "aws_route53_record" "www" {
  zone_id = "My Domain Zone ID"
  name    = "httpd.safedevops.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web_output.public_ip}"]
}


// Outputs Everything

output "Instance_id" {
  value = "${aws_instance.web_output.id}"
}

output "key_name" {
  value = "${aws_key_pair.us-east-1-key-output.key_name}"
}

output "Instance_ip" {
  value = "${aws_instance.web_output.public_ip}"
}

output "Instance_arn" {
  value = "${aws_instance.web_output.arn}"
}

output "Instance_public_dns" {
  value = "${aws_instance.web_output.public_dns}"
}


output "my_message" {
  value = "Login to worldpress and reset  password"
}

