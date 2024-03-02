variable "resource_group_name" {

  type = string
  description = "Resource Group Name"
  default = "rg-apim"

}

variable "apim_service_name" {

  type = string
  description = "APIM Service Name"
  default = "apim-eus-dev-test"

}

variable "primary_apim_key" {
  
  type = string
  description = "Primary API Subscription Key"
  default = "f8dd61f4bd7b4de2b70df1d313775b7a"
}

variable "secondary_apim_key" {
  
  type = string
  description = "Secondary API Subscription Key"
  default = "b5f50fae11d1463fbf50ba3be2c4c7fe"
}