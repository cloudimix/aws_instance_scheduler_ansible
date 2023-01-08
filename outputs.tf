output "workstations_public_ips" {
  value = aws_instance.workstation[*].public_ip
}

output "master_public_ip" {
  value = aws_instance.master.public_ip
}
