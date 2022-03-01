output "presentation_id" {
  value = tomap({
    for k, inst in aws_subnet.presentation : k => inst.id
  })
}

output "application_id" {
  value = tomap({
    for k, inst in aws_subnet.application : k => inst.id
  })
}

output "database_id" {
  value = tomap({
    for k, inst in aws_subnet.database : k => inst.id
  })
}

output "security_group_id" {
  value = aws_security_group.example.id
}

