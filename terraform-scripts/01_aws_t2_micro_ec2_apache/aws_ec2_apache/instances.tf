resource "aws_instance" "terraform_instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  tags                        = var.instance_tags
  subnet_id                   = aws_subnet.terraform_subnet1.id
  vpc_security_group_ids      = ["${aws_security_group.terraform_sg.id}"]
  associate_public_ip_address = true
  availability_zone           = var.availability_zone1
  user_data                   = file("scripts/install.sh")
}