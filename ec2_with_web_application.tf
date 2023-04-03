resource "aws_instance" "web_server" {
  ami = "ami-0c94855ba95c71c99" # Use the appropriate AMI ID for your desired OS
  instance_type = "t2.micro"
  key_name = "my-key-pair"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private.id
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo echo "<html><body><h1>Welcome to my web server</h1></body></html>" > /var/www/html/index.html
              sudo service httpd start
              EOF

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "web_server" {
  ...
  monitoring = true
  ...
}

resource "aws_nat_gateway" "nat_gateway" {
  ...
  depends_on = [aws_eip.nat_eip]
  enable = true
  ...
}
