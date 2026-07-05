output "public_ips"{value={for k,v in aws_instance.srv:k=>v.public_ip}}
