#!/bin/bash

# set up the terraform azure provider from versions.tf
echo
echo ------------------------------------------------------------
echo  Initialising terraform Azure provider
echo ------------------------------------------------------------
echo
terraform init

# set ARM_SUBSCRIPTION_ID variable for terraformer to work
#
ARM_SUBSCRIPTION_ID=$(az account show --query="id" --output=tsv)
export ARM_SUBSCRIPTION_ID

# import resources
echo 
echo ------------------------------------------------------------
echo -- Importing resources using terraformer
echo ------------------------------------------------------------
echo 
terraformer import azure --resources=* --resource-group=rg-jr-test --compact --path-pattern="{output}/{provider}/"