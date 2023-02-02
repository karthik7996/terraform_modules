output "instance_vpc_id" {
  value = aws_vpc.instance_vpc
}

output "instance_vpc_cidr_block" {
  value = aws_vpc.instance_vpc.cidr_block
}

output "subnet_id" {
  value = aws_subnet.my_vpc_subnet.id
}

output "my_vpc_internet_gateway_id" {
  value = aws_internet_gateway.my_vpc_gw.id
}

output "my_vpc_route_table_id" {
  value = aws_route_table.my_vpc_route_table.id
}
