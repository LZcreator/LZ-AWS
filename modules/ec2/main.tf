# This resource creates a standard EC2 instance in the public subnet
resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type                # EC2 instance type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id] # List of security groups attached to the instance
  key_name               = data.aws_key_pair.key.key_name             # Name of the existing key pair for SSH access

  user_data = file("userdata.sh")                                     # Script to run on instance launch (e.g., installing packages)

  tags = {
    "Name" = "${each.value}-${local.sufix}"                           # Tag for identifying the instance with a suffix
  }
}

# This resource conditionally creates a monitoring EC2 instance only if 'enable_monitoring' equals 1
resource "aws_instance" "monitoring_instance" {
  for_each = var.enable_monitoring == 1 ? { "instance_1" = 1 } : {}   # Conditional creation: if true, create one instance

  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type                # EC2 instance type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id] # Security group for access control
  key_name               = data.aws_key_pair.key.key_name             # SSH key pair
  user_data              = file("userdata.sh")                        # Startup script

  tags = {
    "Name" = "Monitoring..."                                          # Tag to identify this instance as the monitoring one
  }
}