resource "aws_subnet" "praivate_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_subnet[1]
  availability_zone="us-east-1a"
  tags = {
    Name = "praivate_subnet1"
  }
}
resource "aws_subnet" "praivate_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_subnet[3]
  availability_zone="us-east-1b"
  tags = {
    Name = "praivate_subnet2"
  }
}