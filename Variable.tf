variable "rds" {
  description = "Value of the Name RDS instance"
  type        = list(string)
  default     = ["mydb_instance", "mysql", "5.7", "db.t3.micro", "root", "Rootmysql57", "default.mysql5.7"]
}

variable "sqs" {
  description = "Name of SQS"
  type        = string
  default     = "Testwork"

}

variable "lambda" {
  description = "Lambda list"
  type        = list(any)
  default     = ["Fullstack", "python3.8"]


}


variable "ssm" {
  description = "Name of SSM"
  type        = string
  default     = "rdshost"

}