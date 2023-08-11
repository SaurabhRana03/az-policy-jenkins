  provider "azurerm" {
    features {}
   subscription_id   = "8255ac32-9f68-4301-842e-bf2af93f722b"
   tenant_id         = "cbca795f-2a9e-4c12-af35-a9fce183406e"
   client_id         = "e9ae6537-d723-4b3c-b7fc-907dbd4a57e7"
   client_secret     = ""
  }

  terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = ">= 2.96.0"
      }
  }
  
}
  module "policy-as-code" {
  source  = "./module/policy-as-code"
}
  module "policy-assignment" {
  source  = "./module/policy-assignment"
  subscription_id = "/subscriptions/8255ac32-9f68-4301-842e-bf2af93f722b"
  policy_def_id = module.policy-as-code.policy_definition_ids

}
  module "policy-set-as-code" {
  source  = "./module/policy-set-as-code"
}

 module "policy-set-assignment" {
  source  = "./module/policy-set-assignment"
  subscription_id = "/subscriptions/8255ac32-9f68-4301-842e-bf2af93f722b"
}

