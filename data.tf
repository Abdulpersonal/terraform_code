data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/pyfile/"
  output_path = "${path.module}/pyfile/python.zip"
}