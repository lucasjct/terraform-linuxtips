variable "instance_type" {

  type        = list(string)
  default     = ["t2.micro", "t3.medium"]
  description = "The list of instance type"

}