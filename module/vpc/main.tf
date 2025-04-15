resource "aws_vpc" "main" {
  cidr_block = var.cdir

  tags = {

    name = "${var.env}-vpc"

  }
}

