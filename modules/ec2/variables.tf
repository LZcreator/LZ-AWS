# Variable defining public instance names
variable "instance_name" {
  description = "Names for the public instances"
  type        = set(string) # Unique list of instance names
}

# Variable storing the public subnet
variable "public_subnet" {
  description = "Public subnet ID"
  type        = string
}

# Variable storing the private subnet
variable "private_subnet" {
  description = "Private subnet ID"
  type        = string
}

# EC2 specifications including AMI and instance type
variable "ec2_specs" {
  description = "EC2 specifications including AMI and instance type"
  type = object({
    ami           = string
    instance_type = string
  })
}

# Default values for EC2 specs, ensuring proper references
variable "default_ec2_specs" {
  description = "Default EC2 specs including AMI and instance type"
  type = object({
    ami           = string
    instance_type = string
  })

  default = {
    ami           = "ami-0f3f13f145e66a0a3"  # Corrected default AMI
    instance_type = "t2.micro"              # Corrected default instance type
  }
}

# Variable for enabling monitoring server deployment
variable "enable_monitoring" {
  description = "Enables monitoring server deployment"
  type        = bool  # Changed to bool for clarity (true/false instead of numbers)
  default     = false
}

