#
resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  key_name               = data.aws_key_pair.key.key_name

  user_data = file("userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}

#
resource "aws_instance" "monitoring_instance" {
  count                  = var.enable_monitoring == 1 ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  key_name               = data.aws_key_pair.key.key_name

  user_data = file("userdata.sh")
  
  tags = {
    "Name" = "Monitoreo"
  }
}

