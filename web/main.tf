#ec2

resource "aws_instance" "server" {
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  subnet_id = var.sn
  security_groups = [var.sg]

  tags = {
    Name = "myserver"
  }
}
