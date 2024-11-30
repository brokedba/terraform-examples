# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

terraform {
  required_version =">= 1.2" #">= 1.1"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6" #">= 5" #"~> 4, < 5"
      # https://registry.terraform.io/providers/oracle/oci/
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
      # https://registry.terraform.io/providers/hashicorp/kubernetes/
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2"
      # https://registry.terraform.io/providers/hashicorp/local/
    }
  }
}