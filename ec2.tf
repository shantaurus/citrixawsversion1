locals{servers=["DC01","DDC01","SF01","GOLD01"]}
data "aws_ami" "win"{most_recent=true owners=["amazon"] filter{name="name" values=["Windows_Server-2022-English-Full-Base*"]}}
resource "aws_instance" "srv"{for_each=toset(local.servers)
ami=data.aws_ami.win.id
instance_type="t3.large"
subnet_id=aws_subnet.public.id
vpc_security_group_ids=[aws_security_group.windows.id]
iam_instance_profile=aws_iam_instance_profile.profile.name
key_name=var.key_name
tags={Name=each.key}}