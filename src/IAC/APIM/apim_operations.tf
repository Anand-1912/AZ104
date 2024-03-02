resource "azurerm_api_management_api_operation" "get_coupons" {
  operation_id        = "GetCoupons"
  api_name            = azurerm_api_management_api.coupon.name
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  display_name        = "GetCoupons"
  method              = "GET"
  url_template        = "/api/coupon"
  description         = "Retrieve the exchange rates."

 response {
    status_code = 200
  }
}