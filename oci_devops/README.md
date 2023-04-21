
## Sample illustration to user OCI DevOps Build pipeline's predefined system variables.


## Predefined System Variables (of OCI Build pipeline stage)

DevOps provides a set of predefined system variables with default values that you can use like environment variables in the build specification. These values are available within DevOps managed build stages and can expose to other stages via an explicit export of the variables.
You need to export these values with another variable name which is following below patters.

```markdown
Parameter name can only consist of ASCII letter, digit or '_' (underscore) characters and not start with an oci (case-insensitive) prefix
```

System Variables | Description | 
--- | --- | 
OCI_STAGE_ID | The OCID of the current stage. | 
OCI_PIPELINE_ID|The OCID of the current build pipeline.|
OCI_BUILD_RUN_ID|The OCID of the current build run.|
OCI_TRIGGER_COMMIT_HASH|Commit hash of the current trigger.|
OCI_TRIGGER_SOURCE_BRANCH_NAME|Branch that triggers the build.|
OCI_TRIGGER_SOURCE_URL|Repository URL that triggered the build|
OCI_TRIGGER_EVENT_TYPE|Trigger that started the event.|
OCI_PRIMARY_SOURCE_DIR|Default working directory of the build (primary source working directory).|
OCI_WORKSPACE_DIR|Working directory value. Contains /workspace as the default value.|
${OCI_WORKSPACE_DIR}/ "source-name"|Build source directory path."source-name" is the name of the build source given by the user while creating the Build stage.|
OCI_BUILD_STAGE_NAME|Build stage name.|
OCI_PRIMARY_SOURCE_NAME|Primary build source name.|
OCI_PRIMARY_SOURCE_COMMIT_HASH|Primary build source commit hash used in the current build run.|
OCI_PRIMARY_SOURCE_SOURCE_URL|Primary build source URL.|
OCI_PRIMARY_SOURCE_SOURCE_BRANCH_NAME| Primary build source branch used in the current build run.|

Reference - https://docs.oracle.com/en-us/iaas/Content/devops/using/build_specs.htm


## This is a fork with multiple TF exmaple of various CSP .

Add - ons 

-----

- Added build_spec.yaml to use it behind an OCI devops build pipeline.
  -  documentation - https://docs.oracle.com/en-us/iaas/Content/devops/using/home.htm 

  - We do use two build params to call the contents dynamically change the tf root path.

![image](https://user-images.githubusercontent.com/29458929/233540123-14e8ec6d-908d-45d2-85b5-e7c336a8420a.png)

  - This will help to switch TF root based on  parameters while invoking the build pipelines (be it via console ,cli ,api sdks or via terraform).


- An example of build run with OCI CLI as follows 

```
oci devops build-run create --build-pipeline-id ocid1.devopsbuildpipeline.oc1.iad.xxxx --build-run-arguments '{ "items": [ { "name": "TF_RESOURC_REFERENCE", "value": "create-vcn" }, { "name": "TF_PROVIDER_PATH", "value": "terraform-provider-oci" } ] }'

```


- OCI CLI documentation - https://docs.oracle.com/en-us/iaas/Content/devops/using/run_build.htm#runbuild_cli  
- Details view of OCI CLI with build run - https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.4.4/oci_cli_docs/cmdref/devops/build-run.html 


Sample exeuction via OCI CLI and snippets from corresponding build run.

----

#### Use OCI TF Provider and resource type as OCI launch-instance 


```
$ oci devops build-run create --build-pipeline-id ocid1.devopsbuildpipeline.oc1.iad.xxjq --build-run-arguments '{ "items": [ { "name": "TF_RESOURC_REFERENCE", "value": "launch-instance" }, { "name": "TF_PROVIDER_PATH", "value": "terraform-provider-oci" } ] }'  

```

![image](https://user-images.githubusercontent.com/29458929/233540201-cfc72d6f-a005-4349-b676-b8baf2ad5d0c.png)


#### Use OCI TF Provider and resource type as OCI create-vcn

```
$ oci devops build-run create --build-pipeline-id ocid1.devopsbuildpipeline.oc1.iad.xxjq  --build-run-arguments '{ "items": [ { "name": "TF_RESOURC_REFERENCE", "value": "create-vcn" }, { "name": "TF_PROVIDER_PATH", "value": "terraform-provider-oci" } ] }' – Same pipeline ,with OCI buit this time with create-vcn resource 
```

![image](https://user-images.githubusercontent.com/29458929/233540227-379572c1-d7a4-400b-952c-8b023d92559a.png)


#### Use GCP  TF Provider and resource type as GCP create-vpc

```
$ oci devops build-run create --build-pipeline-id ocid1.devopsbuildpipeline.oc1.iad.xxjq --build-run-arguments '{ "items": [ { "name": "TF_RESOURC_REFERENCE", "value": "create-vpc" }, { "name": "TF_PROVIDER_PATH", "value": "terraform-provider-gcp" } ] }' – In this case switching in to GCP TF with a resource type of GCP 
```

![image](https://user-images.githubusercontent.com/29458929/233540245-29e259fe-6dab-4ca0-a55e-902db3fe2747.png)

## OCI Devops Resources.

 
- Create a DevOps project - https://docs.oracle.com/en-us/iaas/Content/devops/using/create_project.htm
- Create an OCI Code repo - https://docs.oracle.com/en-us/iaas/Content/devops/using/create_repo.htm
- Create a build pipeline - https://docs.oracle.com/en-us/iaas/Content/devops/using/create_buildpipeline.htm
- Push these samples to the OCI Code repo.
- Add a `Managed Build stage` to the build pipeline - https://docs.oracle.com/en-us/iaas/Content/devops/using/add_buildstage.htm
- Run the build pipeline and verify the values.
- You may use these values by defining an external repo (Github/Gitlab or Bitbucket) and validate the executions too - https://docs.oracle.com/en-us/iaas/Content/devops/using/create_connection.htm
 ----
