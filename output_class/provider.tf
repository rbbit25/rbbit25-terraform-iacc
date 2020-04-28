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
  }

// Creates Sec Group



// Creates Route53



// Outputs Everything

output "key_pair" {
  value = "${aws_key_pair.us-east-1-key-output.key_name}"
}

output "Instance_id" {
  value = "{aws_instance.web_output.id}"
}

output "Instance_arn" {
  value = "{aws_instance.web_output.arn}"
}

output "Instance_ip" {
  value = "{aws_instance.web_output.public_ip}"
}

output "my_message" {
  value = "Please login  anc change your paasword"
}

