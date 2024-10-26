locals {
 name = "vault"
}


resource "aws_instance" "vault-app" {

  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.vault_sg.id]
  iam_instance_profile = aws_iam_instance_profile.iam_profile.id
  user_data            = file("${path.module}/userdata.sh")

  root_block_device {
    volume_size           = 10
    volume_type           = "gp3"
    encrypted             = false
    delete_on_termination = true
    tags = {

      Name = "${local.name}-root-volume"
    }
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_size           = var.volume_size
    volume_type           = "gp3"
    encrypted             = false
    delete_on_termination = true
    tags = {

      Name = "${local.name}-ebs-volume"
    }
  }

  tags = {


    Name = "${local.name}"

  }

}
