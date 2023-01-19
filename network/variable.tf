variable "cidr_block_vpc" {
  type = string
}
variable "cidr_block_subnet" {
  type = list(string)
  default = [ "10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
}
variable "availability_zone" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}