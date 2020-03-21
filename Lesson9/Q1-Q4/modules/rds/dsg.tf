resource "aws_db_subnet_group" "dsg" {
  subnet_ids = data.aws_subnet_ids.subnets.ids
}