resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_subnet[0]
  availability_zone="us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_subnet[2]
  availability_zone="us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet2"
  }
}