# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

variable "compartment_ocid" {}
variable "vcn_id" {}
variable "security_list_name" {}
variable "create_security_list" {
  default     = false
  description = "Creates a new security list. If false, bypass the creation."
}
variable "display_name" {
  default     = null
  description = "Display name for the security list."
}
variable "egress_security_rules" {
  type = list(object({
    description      = string
    destination      = string
    destination_type = string
    protocol         = string
    stateless        = bool
    tcp_options = object({
      max = number
      min = number
      source_port_range = object({
        max = number
        min = number
      })
    })
    udp_options = object({
      max = number
      min = number
      source_port_range = object({
        max = number
        min = number
      })
    })
    icmp_options = object({
      type = number
      code = number
    })
  }))
  default = []
}

variable "ingress_security_rules" {
  type = list(object({
    description = string
    source      = string
    source_type = string
    protocol    = string
    stateless   = bool
    tcp_options = object({
      max = number
      min = number
      source_port_range = object({
        max = number
        min = number
      })
    })
    udp_options = object({
      max = number
      min = number
      source_port_range = object({
        max = number
        min = number
      })
    })
    icmp_options = object({
      type = number
      code = number
    })
  }))
  default = []
}

# variable "egress_security_rules" {
#   type = list(object({
#     description      = optional(string)
#     destination      = string
#     destination_type = optional(string)
#     protocol         = string
#     stateless        = optional(bool)
#     tcp_options = optional(object({
#       max = optional(number)
#       min = optional(number)
#       source_port_range = optional(object({
#         max = number
#         min = number
#       }))
#     }))
#     udp_options = optional(object({
#       max = optional(number)
#       min = optional(number)
#       source_port_range = optional(object({
#         max = number
#         min = number
#       }))
#     }))
#     icmp_options = optional(object({
#       type = number
#       code = optional(number)
#     }))
#   }))
#   default = []
# }
# variable "ingress_security_rules" {
#   type = list(object({
#     description = optional(string)
#     source      = string
#     source_type = optional(string)
#     protocol    = string
#     stateless   = optional(bool)
#     tcp_options = optional(object({
#       max = optional(number)
#       min = optional(number)
#       source_port_range = optional(object({
#         max = number
#         min = number
#       }))
#     }))
#     udp_options = optional(object({
#       max = optional(number)
#       min = optional(number)
#       source_port_range = optional(object({
#         max = number
#         min = number
#       }))
#     }))
#     icmp_options = optional(object({
#       type = number
#       code = optional(number)
#     }))
#   }))
#   default = []
# }

# Deployment Details + Freeform Tags + Defined Tags
variable "security_list_tags" {
  description = "Tags to be added to the security list resources"
}