variable "project_id"{
    type = string
    description = "Your Project Id"
}

variable "service_endpoint_name"{
    type = string
    description = "Your Service EndPoint Name"
}

variable "pat" {
  type = string
  sensitive = true
  description = "Your Personal Access Tocken"
}