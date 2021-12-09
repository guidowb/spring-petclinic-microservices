#!/bin/sh

# brew install az
# brew upgrade az
# az login
# az extension remove --name spring-cloud
# az extension add \
#	--source https://ascprivatecli.blob.core.windows.net/enterprise/spring_cloud-2.7.0a3-py3-none-any.whl \
#	--yes
# az spring-cloud create --location east-us --sku basic|enterprise --name basic|enterprise-cloud

# Build, create, and deploy customer (micro-)service
(
	cd spring-petclinic-customers-service
	mvn clean package
	az spring-cloud app create -n customers-service
	az spring-cloud app deploy -n customers-service --artifact-path target/spring-petclinic-customers-service-*.jar
)

# Build, create, and deploy vets (micro-)service
(
	cd spring-petclinic-vets-service
	mvn clean package
	az spring-cloud app create -n vets-service
	az spring-cloud app deploy -n vets-service --artifact-path target/spring-petclinic-vets-service-*.jar
)

# Build, create, and deploy visits (micro-)service
(
	cd spring-petclinic-visits-service
	mvn clean package
	az spring-cloud app create -n visits-service
	az spring-cloud app deploy -n visits-service --artifact-path target/spring-petclinic-visits-service-*.jar
)

# Build, create, and deploy API gateway
(
	cd spring-petclinic-api-gateway
	mvn clean package
	az spring-cloud app create -n petclinic-api-gateway --assign-endpoint true
	az spring-cloud app deploy -n petclinic-api-gateway --artifact-path target/spring-petclinic-api-gateway-*.jar
)

# Build, create, and deploy admin server
(
	cd spring-petclinic-admin-server
	mvn clean package
	az spring-cloud app create -n admin-server
	az spring-cloud app deploy -n admin-server --artifact-path target/spring-petclinic-admin-server-*.jar
)
