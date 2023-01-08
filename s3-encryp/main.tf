resource "aws_kms_key" "samkey" {
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "sams3-encrypt" {
  bucket = "sameer-encrypt"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sam1" {
  bucket = aws_s3_bucket.sams3-encrypt.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.samkey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
