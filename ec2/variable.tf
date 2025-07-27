variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "prd"
}

variable "ec2" {
  description = "EC2 instance configuration"
  type        = object({
    ami           = string
    instance_type = string
    tags          = map(string)
  })
  default = {
    ami           = "ami-020cba7c55df1f615"
    instance_type = "t3.medium"
    tags          = {
      Name = "EC2-OPEN-OPS"
    }
  }
}

