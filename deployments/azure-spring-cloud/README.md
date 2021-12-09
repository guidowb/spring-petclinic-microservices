# Deploying Petclinic Microservices to Azure Spring Cloud

## Using the CLI

```
# brew install az
# brew upgrade az
# az login
# az extension remove --name spring-cloud
# az extension add \
#	--source https://ascprivatecli.blob.core.windows.net/enterprise/spring_cloud-2.7.0a3-py3-none-any.whl \
#	--yes
# az spring-cloud create --location east-us --sku basic|enterprise --name basic|enterprise-cloud
```

## Enterprise Tier

[Link](https://portal.azure.com/?AppPlatformExtension=enterprise) to private preview.
