#----root/variables.tf-----

#----functions defaults-----
variable "function_name_to_stop_instances" {
  default = "stop_instances"
}


variable "function_name_to_start_instances" {
  default = "start_instances"
}

variable "handler" {
  default = "lambda.handler"
}

variable "runtime" {
  default = "python3.6"
}