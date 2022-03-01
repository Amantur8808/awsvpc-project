resource "aws_instance" "presentation" {
  count                       = var.env == "dev" ? 1 : 0
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip
  private_ip                  = var.presentation_private_ip
  vpc_security_group_ids      = [var.security_group_ids]
  key_name                    = var.key_name
  subnet_id                   = var.presentation
  tags = {
    Name = "${var.env} ${var.first_name}"
  }

  provisioner "file" {
    source      = var.path
    destination = var.destination
  }

  connection {
    type        = var.type
    user        = var.user
    private_key = local.key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/ec2-user/.ssh/test.pem",
      "scp -o StrictHostKeyChecking=no -i /home/ec2-user/.ssh/test.pem /home/ec2-user/.ssh/test.pem ec2-user@10.0.11.65:/home/ec2-user/.ssh/test.pem"
    ]
  }
  depends_on = [aws_instance.application]


}

resource "aws_instance" "application" {
  count                  = var.env == "dev" ? 1 : 0
  ami                    = var.ami
  instance_type          = var.instance_type
  private_ip             = var.application_private_ip
  vpc_security_group_ids = [var.security_group_ids]
  key_name               = var.key_name
  subnet_id              = var.application
  tags = {
    Name = "${var.env} ${var.second_name}"
  }

}

resource "aws_instance" "database" {
  count                  = var.env == "dev" ? 1 : 0
  ami                    = var.ami
  instance_type          = var.instance_type
  private_ip             = var.database_private_ip
  vpc_security_group_ids = [var.security_group_ids]
  key_name               = var.key_name
  subnet_id              = var.database
  tags = {
    Name = "${var.env} ${var.third_name}"
  }

}

