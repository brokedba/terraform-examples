# # Oracle Cloud Infrastructure Authentication
# tenancy_ocid     = "ocid1.tenancy.oc1.."      # CHANGE ME
# user_ocid        = "ocid1.user.oc1.."         # CHANGE ME
# fingerprint      = "1c:"                      # CHANGE ME
# private_key_path = "~/oci_api_key.pem"        # CHANGE ME
# ssh_public_key   = "~/id_rsa.pub" # CHANGE ME
# compartment_ocid = "ocid1.compartment.oc1."   # CHANGE ME
# # Region
# region = "ca-toronto-1"                       # CHANGE ME
# # AD
# availability_domain = "CA-TORONTO-1-AD-1"     # CHANGE ME
# availability_domain_number="1"
# ssh_public_key=$(cat ~/.ssh/id_rsa.pub)
# compartment_ocid=""    # oke's compartment
############### 
#    ADDONS   #
###############
#cluster_type="ENHANCED_CLUSTER"
#prometheus_enabled=true
#grafana_enabled=true
#ingress_nginx_enabled=true
############### 
#   Node Pool #
###############
# node_pool_instance_shape_1='{"instanceShape":"VM.Standard.E4.Flex","ocpus":2,"memory":16}'
# node_pool_name_1="pool1" #oke_pool
# node_pool_initial_num_worker_nodes_1=1
# node_k8s_version="v1.29.1" # worker nodes version
# k8s_version="v1.29.1"      # master /control plane node version
# node_pool_max_num_worker_nodes_1=10
# create_new_vcn=false
