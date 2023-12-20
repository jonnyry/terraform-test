#!/bin/bash

# set up the terraform azure provider from versions.tf
echo
echo ------------------------------------------------------------
echo  Initialising terraform Azure provider
echo ------------------------------------------------------------
echo
terraform init

# import resources
echo 
echo ------------------------------------------------------------
echo -- Importing resources using terraformer
echo ------------------------------------------------------------
echo 
terraformer import azure --resources=* --resource-group=rg-jr-test --compact --path-pattern="{output}/{provider}/"