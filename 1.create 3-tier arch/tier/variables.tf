variable "name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "data_disk" {
  type = string
}

variable "service_account" {
  type = string
}

variable "scopes" {
  type = list(string)
}

variable "subnetwork" {
  type = string
}
