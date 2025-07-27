variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "prd"
}

variable "vpc_id" {
  type = object({
    cidr_block               = string
    name                     = string
    internet_gateway_name    = string
    security_group_name      = string
    nat_gateway_name         = list(string)
    public_route_table_name  = list(string)
    private_route_table_name = list(string)
    public_subnet_name       = list(object({
      name                   = string
      availability_zone      = string
      cidr_block             = string
      map_public_ip_on_launch= bool
    }))
    private_subnet_name      = list(object({
      name                   = string
      availability_zone      = string
      cidr_block             = string
      map_public_ip_on_launch= bool
    }))
  })
  default = {
    name                      = "vpc"
    cidr_block                = "10.10.0.0/16"
    internet_gateway_name     = "internet-gateway"
    security_group_name       = "security-group"
    nat_gateway_name          = "nat-gateway-1"
    public_route_table_name   = ["public-route-table-1", "public-route-table-2"]
    private_route_table_name  = ["private-route-table-1", "private-route-table-2"]
    public_subnet_name        = [
      {
        name                   = "public-subnet-1a"
        availability_zone      = "us-east-1a"
        cidr_block             = "10.10.10.0/24"
        map_public_ip_on_launch= true
      },
      {
        name                   = "public-subnet-1b"
        availability_zone      = "us-east-1b"
        cidr_block             = "10.10.11.0/24"
        map_public_ip_on_launch= true
      }
    ]
    private_subnet_name       = [
      {
        name                   = "private-subnet-1a"
        availability_zone      = "us-east-1a"
        cidr_block             = "10.10.12.0/24"
        map_public_ip_on_launch= false
      },
      {
        name                   = "private-subnet-1b"
        availability_zone      = "us-east-1b"
        cidr_block             = "10.10.13.0/24"
        map_public_ip_on_launch= false
      }
    ]
  }
}
