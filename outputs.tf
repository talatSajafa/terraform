output "server_details" {
  description = "Key details of the created EC2 server"
  value = {
    name = aws_instance.web_server.tags["Name"]
    type = aws_instance.web_server.instance_type
  }
}
