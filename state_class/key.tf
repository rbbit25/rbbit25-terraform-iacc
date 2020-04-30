
resource "aws_key_pair" "state_class_key" {
  key_name   = "state_class_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

