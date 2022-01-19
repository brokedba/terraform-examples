

# Known issues
- The database admin Password should not contain word Oracle or Username(sys).
- The database version must be one of
```
11.2.0.4 or 11.2.0.4.201020 or 11.2.0.4.210119 or 11.2.0.4.210420 or 12.1.0.2 or 12.1.0.2.210420 or 12.1.0.2.210720 or 
12.1.0.2.211019 or 12.2.0.1 or 12.2.0.1.210420 or 12.2.0.1.210720 or 12.2.0.1.211019 or 18.0.0.0 or 18.13.0.0 or 
18.14.0.0 or 18.16.0.0 or 19.0.0.0 or 19.11.0.0 or 19.12.0.0 or 19.13.0.0 or 21.0.0.0 or 21.3.0.0 or 21.4.0.0.
```

- Terraform registry Doc for oci provider is not up to date or the provider has still some bugs not fixed. Example  node_count in db_system resource :

 ![image](https://user-images.githubusercontent.com/29458929/150219444-eb080f56-0d5e-40ea-9276-72e3860755a2.png)
- Please check provider (github issues https://github.com/terraform-providers/terraform-provider-oci/issues) to be sure 
