locals {
  address_space = {
    default = "10.0.0.0/16"
    staging = "10.0.0.0/16"
    testing = "10.1.0.0/16"
    terraform_vcs ="10.1.0.0/16"
  }
  subnet_names = ["subnet1","subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.1.1.0/24" ]
  index_ws = {
    default=0
    staging=0 
    testing=1 
    terraform_vcs=1  
  }
}

resource azurerm_resource_group "rg" {
    name= "${terraform.workspace}-rg1"
    location ="North Europe"
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "3.5.0"
  # insert the 1 required variable here
  resource_group_name = azurerm_resource_group.rg.name
  address_space = local.address_space[terraform.workspace]
  subnet_names= [local.subnet_names[local.index_ws[terraform.workspace]]]
  subnet_prefixes=[local.subnet_prefixes[local.index_ws[terraform.workspace]]]

  depends_on = [
    azurerm_resource_group.rg
  ]
}

output rg_vnet {
    value = module.network.vnet_address_space
}

