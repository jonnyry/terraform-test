#!/bin/bash

# this script demonstrates how to import terraform resources in main.tf that are already present in azure, but not in the state file

SUBSCRIPTION_ID=$(az account show --query="id" --output=tsv)

# import the resource group
terraform import azurerm_resource_group.rg-jr-test "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/rg-jr-test"

# import the vnets
terraform import azurerm_virtual_network.vnet-jr-test "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/rg-jr-test/providers/Microsoft.Network/virtualNetworks/vnet-jr-test"
terraform import azurerm_virtual_network.vnet-jr-test-2 "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/rg-jr-test/providers/Microsoft.Network/virtualNetworks/vnet-jr-test-2"

