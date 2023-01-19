variable "cidr_block_vpc" {
  type = string
}
variable "cidr_block_subnet" {
  type = list(string)
  default = [ "10.0.1.0/24","10.0.2.0/24" ]
}
variable "availability_zone" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}
variable "ami" {
  type = string
}
variable "instance" {
  type = string
}
variable "key" {
type = string
}
# variable "dns_alb" {
# type = string
# }
