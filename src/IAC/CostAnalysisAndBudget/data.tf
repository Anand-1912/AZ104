
data "azurerm_subscription" "current" {

}

data "azurerm_resource_group" "data_rg" {
  name = "rg-${var.suffix}-001"
}

output "data_rg_id" {
  value = data.azurerm_resource_group.data_rg.id
}

resource "azurerm_monitor_action_group" "main" {
  name                = "ag-${var.suffix}-001"
  resource_group_name = data.azurerm_resource_group.data_rg.name
  short_name          = "ag-${var.suffix}-001"
}

resource "azurerm_consumption_budget_subscription" "main" {
  name            = "budget-${var.suffix}-001"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 200
  time_grain = "Monthly"

  time_period {
    start_date = "2024-03-01T00:00:00Z"
    end_date   = "2024-12-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceGroupName"
      values = [
        data.azurerm_resource_group.data_rg.name,
      ]
    }
  }

  notification {
    enabled   = true
    threshold = 90.0
    operator  = "EqualTo"

    contact_emails = [
      "anandchandrasekaran1996@gmail.com"
    ]

    contact_groups = [
      azurerm_monitor_action_group.main.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }
}