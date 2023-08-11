resource "azurerm_subscription_policy_assignment" "assign-policy" {
  name                 = "assign-policy"
  policy_definition_id = "/subscriptions/8255ac32-9f68-4301-842e-bf2af93f722b/providers/Microsoft.Authorization/policyDefinitions/${var.policy_def_id}"
  subscription_id      = var.subscription_id
}
