# Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = module.network.public_subnet_id  # Fixed subnet reference
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  key_name               = data.aws_key_pair.key.key_name
  user_data              = file("${path.module}/userdata.sh") # Ensuring correct file path

  tags = {
    "Name" = "public-instance-${local.sufix}" # Fixed tag reference
  }
}

# Conditional Monitoring Instance
resource "aws_instance" "monitoring_instance" {
  for_each = var.enable_monitoring == 1 ? { "instance_1" = 1 } : {}

  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = module.network.public_subnet_id  # Fixed subnet reference
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  key_name               = data.aws_key_pair.key.key_name
  user_data              = file("${path.module}/userdata.sh")

  tags = {
    "Name" = "Monitoring-instance-${local.sufix}" # Updated tag format
  }
}
