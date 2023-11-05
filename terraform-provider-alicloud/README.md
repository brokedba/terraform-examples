# Alibaba Cloud Infrastructure Provider Examples

This directory contains Terraform configuration files showing how to create specific resources. 
- The create-vpc is intended to demonstrate how to create a vpc along with Vswitch and security group rules.
- The launch-instance contains both the vpc configuration we used above and the instance provisioning configuration.
-  For details on how to run these samples please refere to my blog post

[Terraform for dummies part 7: Deploy a static website on Alibaba Cloud](http://www.brokedba.blogspot.com/2023/11/terraform-for-dummies-part-7-deploy.html)
![image](https://github.com/brokedba/terraform-examples/assets/29458929/4573c2f5-7a79-44f5-a3f8-a89e2a7c5a9a)


![Topology1](https://github-production-user-asset-6210df.s3.amazonaws.com/29458929/280509394-9114f2cc-2c06-4372-8d13-b01077f4b850.png)

`` Please run either one of them at a time (apply and destroy before runing the other) as the VPC attributes are the same .
``


 **Terraform Console**:
- ***Functions:*** Although terraform is a declarative language, there are still myriads of functions you can use to process strings/number/lists/mappings etc. 
you will find an excellent all in one script with examples of most terraform functions in [terrafunctions.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terrafunctions.sh) 

- ***expressions:***  Same goes for expressions here is a simple shell script that creates a main.tf with multiples expressions and apply it for you [terraexpression.sh](https://github.com/brokedba/terraform-examples/blob/master/terraform-provider-azure/terraexpressions.sh) No need to deploy anything in the cloud it's all local.

Credit : [CloudaFFair](https://cloudaffaire.com/terraform-functions/)
