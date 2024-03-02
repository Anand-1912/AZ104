resource "azurerm_api_management_api" "coupon" {
  name                = "CouponAPI"
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  api_management_name = data.azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "CouponAPI"
  protocols           = ["https"]
  service_url         = "https://webappapimbackend.azurewebsites.net/"
}