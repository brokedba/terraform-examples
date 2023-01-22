## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.88.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.internal_reserved_subnet_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.web-server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.terra_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.terra_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.terra_sub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_OS"></a> [OS](#input\_OS) | the selected ami based OS | `string` | `"CENTOS7"` | no |
| <a name="input_admin"></a> [admin](#input\_admin) | OS user | `string` | `"centos"` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | n/a | `string` | `"terra_fw"` | no |
| <a name="input_gcp_credentials"></a> [gcp\_credentials](#input\_gcp\_credentials) | default location of your service account json key file | `string` | `"~/gcp-key.json"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of instances | `string` | `"terrahost.brokedba.com"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | `"TerraCompute"` | no |
| <a name="input_instances_name"></a> [instances\_name](#input\_instances\_name) | Number of instances to create. This value is ignored if static\_ips is provided. | `string` | `"terravm"` | no |
| <a name="input_os_image"></a> [os\_image](#input\_os\_image) | n/a | `map` | <pre>{<br>  "CENTOS7": {<br>    "name": "centos-cloud/centos-7"<br>  },<br>  "RHEL7": {<br>    "name": "rhel-cloud/rhel-7"<br>  },<br>  "SUSE": {<br>    "name": "suse-cloud/sles-15"<br>  },<br>  "UBUNTU": {<br>    "name": "ubuntu-os-cloud/ubuntu-2004-lts"<br>  },<br>  "WINDOWS": {}<br>}</pre> | no |
| <a name="input_osdisk_size"></a> [osdisk\_size](#input\_osdisk\_size) | n/a | `string` | `"30"` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | VNIC INFO | `string` | `"192.168.10.51"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"playground-s-11-f538d00c"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east1"` | no |
| <a name="input_subnet-02_cidr"></a> [subnet-02\_cidr](#input\_subnet-02\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | The project that subnetwork belongs to | `string` | `""` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `string` | `"./cloud-init/centos_userdata.txt"` | no |
| <a name="input_vm_type"></a> [vm\_type](#input\_vm\_type) | n/a | `string` | `"e2-micro"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | VPC INFO | `string` | `"Terravpc"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"us-east1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_SSH_Connection"></a> [SSH\_Connection](#output\_SSH\_Connection) | n/a |
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of vpc's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created vpc's Subnet. |
| <a name="output_Subnet_id"></a> [Subnet\_id](#output\_Subnet\_id) | id of created vpc. |
| <a name="output_fire_wall_rules"></a> [fire\_wall\_rules](#output\_fire\_wall\_rules) | Shows ingress rules of the Security group |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | id of created instances. |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | id of created instances. |
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPs of created instances. |
| <a name="output_project"></a> [project](#output\_project) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IPs of created instances. |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The Name of the newly created vpc |
