


resource "aws_security_group" "publicEc2" {
  name        = "allow_connection_to_publicEc2"
  description = "Allow HTTP"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description     = "HTTP from anywhere"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb_Public.id]
  }
   ingress {
    description     = "ssh from anywhere"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb_Public.id]
  }


  ingress {
    description     = "HTTP from anywhere"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_Public.id]
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    Name = "publicEc2"
  }
}

resource "aws_security_group" "privateEc2" {
  name        = "privateEc2"
  description = "Allow HTTP"
  vpc_id      = module.network.vpc_main_id
  ingress {
    description     = "HTTP from public subnet"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_private.id]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description     = "HTTP from public subnet"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_private.id]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "privateEc2"
  }
}


resource "aws_security_group" "alb_Public" {
  name        = "allow_connection_to_alb_Public"
  description = "Allow HTTP"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description      = "HTTP from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP from anywhere"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_Public"
  }
}


resource "aws_security_group" "alb_private" {
  name        = "alb_private"
  description = "Allow HTTP"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description     = "HTTP from anywhere"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.publicEc2.id]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description     = "HTTP from anywhere"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.publicEc2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_private"
  }
}