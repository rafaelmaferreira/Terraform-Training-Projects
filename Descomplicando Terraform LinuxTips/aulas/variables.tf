variable "image_id" {
  default     = "ami-0c65adc9a5c1b5d7c"
  type        = string
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  default     = "t3.micro"
  type        = string
  description = "The type of EC2 instance to launch"
}

variable "name" {
  type = string
  default = "sem nome"
  description = "nome"
}

variable "projeto" {
  description = "mapa de projetos"
  type = map
  default = {
    projeto1 = {
      instance_type = "t2.micro"
      app_name      = "projeto1"
    },
    projeto2 = {
      instance_type = "t2.micro"
      app_name      = "projeto2"
    },
  }
  
}

variable "nome" {
  type = string

  validation {
    condition = (
      length(var.am_id) > 4 &&
      substr(var.ami_id, 0, 4) == "ami-"
    )
    error_message = "the ami_id value must start with ami-"
  }
  
}
