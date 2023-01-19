variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "app_instance_count" {
  type    = number
  default = 2
}

variable "app_instance_type" {
  type    = string
  default = "f1-micro"
}

variable "app_instance_image" {
  type    = string
  default = "ubuntu-1804-lts"
}

variable "app_instance_data_disk" {
  type    = string
  default = "app-data-disk"
}

variable "db_instance_count" {
  type    = number
  default = 1
}

variable "db_instance_type" {
  type    = string
  default = "f1-micro"
}

variable "db_instance_image" {
  type    = string
  default = "ubuntu-1804-lts"
}

variable "db_instance_data_disk" {
  type    = string
  default = "db-data-disk"
}

variable "service_account" {
  type = string
}

variable "scopes" {
  type = list(string)
}
