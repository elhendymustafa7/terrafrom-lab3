resource "aws_route_table" "priavteRouteTable" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "priavteRouteTable"
  }
}

resource "aws_route" "routePrivateRouteTable" {
  route_table_id = aws_route_table.priavteRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.natGateway.id
}

resource "aws_route_table_association" "RouteTableAssociationPrivate1" {
  subnet_id = aws_subnet.praivate_subnet1.id
  route_table_id = aws_route_table.priavteRouteTable.id
}

resource "aws_route_table_association" "RouteTableAssociationPrivate2" {
  subnet_id = aws_subnet.praivate_subnet2.id
  route_table_id = aws_route_table.priavteRouteTable.id
}