variable "image_id" {
  default     = "ami-0c65adc9a5c1b5d7c"
  type        = string
  description = "The AMI to use for the EC2 instance"
}

variable "name" {
  type = string
  default ="gomex"
  description = "nome do "
}
