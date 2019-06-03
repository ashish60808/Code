
provider "aws" {
    region = "${var.aws_region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

     owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
    ami           = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"

    tags ={
        Name = "Ubuntu"
    }
}
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.148.131.186/32"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.148.131.186/32"]
  }
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["5.148.131.186/32"]
  }
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_s3_bucket" "state_storage" {
  bucket = "state-storage"
  acl    = "public-read"

  tags ={
    Name = "IAC Book Bucket in ${var.aws_region}"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = "${aws_s3_bucket.state_storage.bucket}"
  key = "terraform.tfstate"
  source = "terraform.tfstate"
  acl    = "public-read"
}
output "image_id" {
    value = "${data.aws_ami.ubuntu.id}"
}