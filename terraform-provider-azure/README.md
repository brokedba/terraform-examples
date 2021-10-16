# AZURE Provider Examples
This directory contains Terraform configuration files showing how to create specific resources. The create-vnet is intended to demonstrate how to create a vnet 
along with custom subnets and security group. The launch-instance contains both the vnet configuration we used above and the instance provisioning configuration. 
For details on how to run these samples please refere to my [blog post( Launch a vm with a static website on Azure) >>](https://brokedba.blogspot.com/2021/10/terraform-for-dummies-part-3-launch-vm.html)
![image](https://user-images.githubusercontent.com/29458929/137570644-cf688c8f-df70-490a-b849-6845d3746181.png)


 **Terraform Console**:
- ***Functions:*** Although terraform is a declarative language, there are still myriads of functions you can use to process strings/number/lists/mappings etc. 
you will find an excellent all in one script with examples of most terraform functions in [terrafunctions.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terrafunctions.sh) 

- ***expressions:***  Same goes for expressions here is a simple shell script that creates a main.tf with multiples expressions and apply it for you [terraexpression.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terraexpressions.sh) No need to deploy anything in the cloud it's all local.

Credit : [CloudaFFair](https://cloudaffaire.com/terraform-functions/)
