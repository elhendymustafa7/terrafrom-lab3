resource "aws_eip" "eip" {
}

resource "aws_nat_gateway" "natGateway" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_subnet1.id
  tags = {
    "Name" = "NatGateway"
  }
}