#Set the terraform backend
terraform {
  required_version = "0.11.14"
  backend          "azurerm"        {}        #Backend variables are initialized in secret and variable folders
}

#Set the Provider
provider "azurerm" {
  version         = "1.27.1"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

#Get the Resource Group and the SPN Id

data "azurerm_resource_group" "Infr" {
  name = "${var.rg_infr_name}"
}

data "azurerm_azuread_service_principal" "Infr" {
  application_id = "${var.client_id}"
}