variable "region1" {}
variable "region1_zone_1" {}
variable "region1_zone_2" {}
variable "region2" {}
variable "region2_zone_1" {}
variable "region2_zone_2" {}
variable "gcp_project" {}
variable "credentials" {}
variable "name" {}
variable "os_image" {}

#variable "subnet_cidr" {}

variable "subnet_cidr" {
  type = "map"
}

variable "regions" {
  type = "list"
}
