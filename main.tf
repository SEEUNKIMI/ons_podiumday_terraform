resource "aws_iam_user" "admin_user" {
  name = "admin_user"
}

resource "aws_iam_user_policy" "admin_user_policy" {
  name = "admin_user_policy"
  user = aws_iam_user.admin_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "*",
        Resource = "*"
      }
    ]
  })
}


resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "podium_example_vpc"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "podium_example_subnet"
  }
}

resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.example_subnet.id
#   availability_zone = var.availability_zone

  tags = {
    Name = "podium_example_instance"
  }
}
