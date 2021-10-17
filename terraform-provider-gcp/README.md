# GCP Provider Examples

This directory contains Terraform configuration files showing how to create specific resources. The create-vpc is intended to demonstrate how to create a vpc 
along with custom subnets and firewalls. The launch-instance contains both the vpc configuration we used above and the copute engine instance provisioning/configuration. 
For details on how to run these samples please refere to my [blog post >>](https://brokedba.blogspot.com)

![image](https://user-images.githubusercontent.com/29458929/137646325-9b216b7e-54cd-4089-a485-01db8be23cde.png)


 **Terraform Console**:
- ***Functions:*** Although terraform is a declarative language, there are still myriads of functions you can use to process strings/number/lists/mappings etc. 
you will find an excellent all in one script with examples of most terraform functions in [terrafunctions.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-gcp/terrafunctions.sh) 

- ***expressions:***  Same goes for expressions here is a simple shell script that creates a main.tf with multiples expressions and apply it for you [terraexpression.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-gcp/terraexpressions.sh) No need to deploy anything in the cloud it's all local.

Credit : [CloudaFFair](https://cloudaffaire.com/terraform-functions/)
