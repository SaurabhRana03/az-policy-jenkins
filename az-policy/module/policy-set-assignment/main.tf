resource "azurerm_subscription_policy_assignment" "assign-initiative" {
  name                 = "assign-initiative"
  policy_definition_id = "/subscriptions/8255ac32-9f68-4301-842e-bf2af93f722b/providers/Microsoft.Authorization/policySetDefinitions/testPolicySet"
  subscription_id = var.subscription_id
  identity   {
             type = "SystemAssigned"
          }
  location = "uksouth"
  }


