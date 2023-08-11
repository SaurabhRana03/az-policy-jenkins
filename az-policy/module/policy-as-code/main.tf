resource "azurerm_policy_definition" "policy" {
  name         = "accTestPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Configure a minimum TLS version"


  metadata = <<METADATA
    {
    "version": "1.0.0",
    "category": "Storage"
    }

METADATA


  policy_rule = <<POLICY_RULE
    {
          "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Storage/storageAccounts"
          },
          {
            "anyOf": [
              {
                "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
                "notEquals": "[parameters('minimumTlsVersion')]"
              },
              {
                "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
                "exists": "false"
              }
            ]
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]"
      }
    }
POLICY_RULE

  parameters = <<PARAMETERS
 {
     "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the audit policy"
        },
        "allowedValues": [
          "Deny",
          "Audit"
        ],
        "defaultValue": "Deny"
      },
      "minimumTlsVersion": {
        "type": "String",
        "metadata": {
          "displayName": "Minimum TLS Version",
          "description": "Minimum version of TLS required to access data in this storage account"
        },
        "allowedValues": [
          "TLS1_2"
        ],
        "defaultValue": "TLS1_2"
      }  
}
PARAMETERS

}
