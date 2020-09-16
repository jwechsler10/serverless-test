resource "aws_s3_bucket" "front_end_bucket" {

  bucket = "jmw-dev-serverless"
  acl    = "public-read"
  policy = file("policy.json")

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "jmw-serverless-dev"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }

}

resource "aws_s3_bucket_object" "website_files" {
  for_each     = fileset(var.upload_directory, "**/*.*")
  bucket       = aws_s3_bucket.front_end_bucket.bucket
  key          = replace(each.value, var.upload_directory, "")
  source       = "${var.upload_directory}${each.value}"
  acl          = "public-read"
  etag         = filemd5("${var.upload_directory}${each.value}")
  content_type = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}
