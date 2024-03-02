resource "azurerm_api_management_product" "apim_product" {

  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  product_id            = "external_apis"
  display_name          = "External APIs"
  published             = true
  subscription_required = true
  
  depends_on = [
    azurerm_api_management_api.coupon
  ]
}

resource "azurerm_api_management_product_api" "apim_product_api" {
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  api_name            = azurerm_api_management_api.coupon.name
  product_id          = azurerm_api_management_product.apim_product.product_id

  depends_on = [
    azurerm_api_management_api.coupon,
    azurerm_api_management_product.apim_product
  ]
}


resource "azurerm_api_management_subscription" "apim_subscription" {
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name

  display_name  = "Exchange Rate Service Subscription"
  product_id    = azurerm_api_management_product.apim_product.id
  state         = "active"
  primary_key   = var.primary_apim_key
  secondary_key = var.secondary_apim_key
  allow_tracing = true

  depends_on = [ 
    azurerm_api_management_api.coupon 
    ]
}