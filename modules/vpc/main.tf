resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env}-${var.project_name}-vpc"
  }
}


resource "aws_subnet" "main" {
  count  = length(var.subnets_cidr)
  vpc_id = aws_vpc.main.id
# cidr_block = "10.0.1.0/24"
  cidr_block = element(var.subnets_cidr, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
      Name = "subnet-${count.index}"
  }
}

resource "aws_vpc_peering_connection" "main" {
  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.default.id
}
