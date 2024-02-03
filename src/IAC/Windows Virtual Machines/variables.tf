variable "suffix" {
  default = "Az104"
  type    = string
}

variable "location" {
  default = "uksouth"
  type    = string
}

variable "vm_size" {
  default = "Standard_D2_v2"

  validation {
    condition     = (var.vm_size == "Standard_D2_v2" || var.vm_size == "Standard_B1s")
    error_message = "Invalid VM Size"
  }
}

variable "install_iis" {
  type    = bool
  default = false
}