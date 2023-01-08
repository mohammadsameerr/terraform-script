resource "aws_ebs_volume" "sam-ebs" {
  availability_zone = var.availability_zone
  size              = var.size
  tags = {
    Name = "samEBS1"
  }
}

resource "aws_instance" "Sameer_web" {
  ami               = var.ami-id
  availability_zone = var.availability_zone
  instance_type     = var.instance-type

  tags = {
    Name = "Sam-ec2-1"
  }
}

resource "aws_volume_attachment" "ebs" {
  device_name =  "/dev/sdh"
  volume_id   = aws_ebs_volume.sam-ebs.id
  instance_id = aws_instance.Sameer_web.id
}


