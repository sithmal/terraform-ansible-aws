### The bastion
resource "aws_instance" "bastion" {
  ami                    = var.ami
  availability_zone      = var.az
  instance_type          = var.ec2_type
  key_name               = var.ssh-key
  # vpc_security_group_ids = [aws_default_security_group.sg-public.id]
  # subnet_id              = aws_subnet.public.id

  tags = {
    Name        = "Bastion"
    Projet      = var.project
    application = var.application
  }

  volume_tags = {
    Name        = "Bastion"
    Projet      = var.project
    application = var.application
  }

  root_block_device {
    volume_size = 8
  }
}

### The Elastic IP for the Bastion
resource "aws_eip" "eip-bastion" {
  vpc                       = true
  instance                  = aws_instance.bastion.id
  associate_with_private_ip = aws_instance.bastion.private_ip

  tags = {
    Name        = "bastion"
    Projet      = var.project
    application = var.application
  }
}

### The private instances
resource "aws_instance" "i-private" {
  ami                    = var.ami
  availability_zone      = var.az
  instance_type          = var.ec2_type
  key_name               = var.ssh-key
  # vpc_security_group_ids = [aws_default_security_group.sg-private.id]
  # subnet_id              = aws_subnet.private.id

  tags = {
    Name        = "i-private"
    Projet      = var.project
    application = var.application
  }

  volume_tags = {
    Name        = "i-private"
    Projet      = var.project
    application = var.application
  }

  root_block_device {
    volume_size = 8
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = var.ebs_type
    volume_size = 8
  }

  count = var.ec2_nb
}