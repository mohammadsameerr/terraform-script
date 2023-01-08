output "ec2output" {
  value = aws_instance.sameer_web.id
}

output "ebsoutput" {
  value = aws_ebs_volume.sam-ebs
}
