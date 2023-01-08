
resource "aws_iam_role" "sam-repl" {
  name = "s3-vr-role"

  assume_role_policy = var.assume_role_policy
}
resource "aws_iam_policy" "repl" {
  name = "s3-vr-policy"

  policy = var.policy
}

resource "aws_iam_role_policy_attachment" "repl" {
  role       = aws_iam_role.repl.name
  policy_arn = aws_iam_policy.repl.arn
}

resource "aws_s3_bucket" "destination" {
  bucket = "s3-version-bucc"
}

resource "aws_s3_bucket_versioning" "destination" {
  bucket = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "sam-source" {
  provider = aws.replica

  bucket   = "s3replication-buc"
}

resource "aws_s3_bucket_acl" "sam_bucket_acl" {
  provider = aws.replica

  bucket = aws_s3_bucket.sam-source.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "source" {
  provider = aws.replica

  bucket = aws_s3_bucket.sam-source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider = aws.replica
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source]

  role   = aws_iam_role.sam-repl.arn
  bucket = aws_s3_bucket.sam-source.id

  rule {
    id = "foobar"

    filter {
      prefix = "foo"
    }

    status = "Enabled"

    delete_marker_replication {
  status = "Enabled"
}

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}
