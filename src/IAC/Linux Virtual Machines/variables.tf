variable "suffix" {
  default = "Az104"
  type    = string
}

variable "vm_size" {
  default = "Standard_B2s"

  validation {
    condition     = (var.vm_size == "Standard_D2_v2" || var.vm_size == "Standard_B1s" || var.vm_size == "Standard_B2s")
    error_message = "Invalid VM Size"
  }
}