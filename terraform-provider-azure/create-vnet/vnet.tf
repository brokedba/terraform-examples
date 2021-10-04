 terraform {
      required_version = ">= 1.0.3"
    }
provider "azurerm" {
    features {
          }
    }
#################
# RESOURCE GROUP
#################

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = "${var.az_location}"
}

#################
# VNET
#################
resource "azurerm_virtual_network" "terra_vnet" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  address_space       = [var.vnet_cidr]
}
#################
# SUBNET
#################
# aws_subnet.terra_sub:
resource "azurerm_subnet" "terra_sub" {
  name                 = "internal"
  virtual_network_name = "${azurerm_virtual_network.terra_vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefixes     = [var.subnet_cidr]
}

######################
# Network Security Group
######################    
# aws_security_group.terra_sg:
resource "azurerm_network_security_group" "terra_nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Egress"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
security_rule {
    name                       = "Inbound HTTP access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_ranges          = ["22","80","443","3389"]
    destination_port_ranges     = ["22","80","443","3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "RDP-HTTP-HTTPS ingress trafic" 
  }

  
tags = {
    Name = "SSH ,HTTP, and HTTPS"
  }
    timeouts {}
}

resource "azurerm_subnet_network_security_group_association" "nsg_sub" {
  subnet_id                 = azurerm_subnet.terra_sub.id
  network_security_group_id = azurerm_network_security_group.terra_nsg.id
}