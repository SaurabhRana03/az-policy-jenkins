resource "azurerm_policy_set_definition" "policy-set" {
  name         = "testPolicySet"
  policy_type  = "Custom"
  display_name = "Test Policy Set"
  
  parameters = <<PARAMETERS
    {
     
}
PARAMETERS

  policy_definition_reference {
    policy_definition_id = "/subscriptions/8255ac32-9f68-4301-842e-bf2af93f722b/providers/Microsoft.Authorization/policyDefinitions/accTestPolicy"   
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/13502221-8df0-4414-9937-de9c5c4e396b"
  }
}
