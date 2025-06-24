variable "s3_bucket_foreach" {
  type = list(object({
    name          = string
    force_destroy = string
  }))
  default = [
    {
      name          = "my-bucket-1-demo1"
      force_destroy = "true"
    },
    {
      name          = "my-bucket-2-demo2"
      force_destroy = "false"
    },
    {
      name          = "my-bucket-3-demo3"
      force_destroy = "true"
    },
    {
      name          = "my-bucket-4-demo4"
      force_destroy = "false"
    }
  ]
}
resource "aws_s3_bucket" "bucket" {
  for_each      = { for bucket in var.s3_bucket_foreach : bucket.name => bucket }
  bucket        = each.value.name
  force_destroy = each.value.force_destroy

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}

