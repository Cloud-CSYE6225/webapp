
variable "aws_access_key" {
  type    = string
  default = "AKIAWS3YNDQKINEDVOEK"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_secret_key" {
  type    = string
  default = "lT/Heagaju+6svXNl4ERM4rqP62n9/dcn6CuaxCF"
}

data "amazon-ami" "awsdev_ami" {
  access_key = "${var.aws_access_key}"
  filters = {
    name                = "amzn2-ami-hvm-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["amazon"]
  region      = "${var.aws_region}"
  secret_key  = "${var.aws_secret_key}"
}

source "amazon-ebs" "Custom_AMI" {
  access_key    = "${var.aws_access_key}"
  ami_name      = "Custom AMI"
  ami_users     = ["181600461636"]
  instance_type = "t2.micro"
  region        = "${var.aws_region}"
  secret_key    = "${var.aws_secret_key}"
  source_ami    = "${data.amazon-ami.awsdev_ami.id}"
  ssh_username  = "ec2-user"
  tags = {
    Name = "Custom AMI"
  }
}

build {
  sources = ["source.amazon-ebs.Custom_AMI"]

  provisioner "file" {
    destination = "/tmp/node.sh"
    source      = "tmp/node.sh"
  }

  provisioner "file" {
    destination = "/tmp/postgresql.sh"
    source      = "tmp/postgresql.sh"
  }

  provisioner "file" {
    destination = "/tmp/node.service"
    source      = "../service/node.service"
  }

  provisioner "file" {
    destination = "/home/ec2-user/webapp.zip"
    source      = "../webapp.zip"
  }

  provisioner "shell" {
    inline = ["sudo chmod +x /tmp/node.sh", "sudo /tmp/node.sh", "sudo chmod +x /tmp/postgresql.sh", "sudo /tmp/postgresql.sh"]
  }

  provisioner "shell" {
    inline = ["rpm -Va --nofiles --nodigest"]
  }

}
