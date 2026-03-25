resource "aws_instance" "example" {
  for_each = tomap({
    web = "t2.micro"
    db  = "t2.small"
  })

  instance_type = each.value
}