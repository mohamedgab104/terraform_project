variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "frontend_instance_type" {
  description = "EC2 instance type for frontend"
  default     = "t2.micro"
}

variable "backend_instance_type" {
  description = "EC2 instance type for backend"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0c55b159cbfafe1f0" # Example AMI ID for Amazon Linux 2
}

