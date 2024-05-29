output "user_arn" {
  value       = aws_iam_user.admin_user.arn
  description = "ARN of the IAM user"
}

output "vpc_id" {
  value       = aws_vpc.example_vpc.id
  description = "ID of the created VPC"
}

output "subnet_id" {
  value       = aws_subnet.example_subnet.id
  description = "ID of the created Subnet"
}

output "instance_id" {
  value       = aws_instance.example_instance.id
  description = "ID of the created EC2 instance"
}