resource aws_s3_bucket "first_bucket"{
    count=2
    bucket=var.bucket_names[count.index]
    tags={
        Name:"${var.environment}-bucket"
        Environment:var.environment
    }
}
resource aws_s3_bucket "second_bucket"{
    for_each=var.bucket_names_set
    bucket=each.value
    tags={
        Name:"${var.environment}-bucket"
        Environment:var.environment
    }
    depends_on = [ aws_s3_bucket.first_bucket ]
}