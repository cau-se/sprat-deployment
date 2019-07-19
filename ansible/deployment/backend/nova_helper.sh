#!/bin/bash

# With the addition of Keystone, to use an openstack cloud you should
# authenticate against keystone, which returns a **Token** and **Service
# Catalog**.  The catalog contains the endpoint for all services the
# user/tenant has access to - including nova, glance, keystone, swift.
#
# *NOTE*: Using the 2.0 *auth api* does not mean that compute api is 2.0.  We
# will use the 1.1 *compute api*
export OS_AUTH_URL=$1

# With the addition of Keystone we have standardized on the term **tenant**
# as the entity that owns the resources.
#export OS_TENANT_ID=8223f4f6d1b84c8b806f4304445e8649
export OS_TENANT_NAME=$2

# In addition to the owning entity (tenant), openstack stores the entity
# performing the action as the **user**.
export OS_USERNAME=$3

# With Keystone you pass the keystone password.
#echo "Please enter your OpenStack Password: "
#read -sr OS_PASSWORD_INPUT
#export OS_PASSWORD=$OS_PASSWORD_INPUT
export OS_PASSWORD=$4


if   [ $5 == "image" ]
	then
	nova --insecure image-list | grep $6 | cut -d'|' -f2 | tr -d ' '
elif [ $5 == "flavor" ]
	then
	nova --insecure flavor-list | grep $6 | cut -d'|' -f2 | tr -d ' '
elif [ $5 == "getip" ]
	then
	nova --insecure floating-ip-list | grep " - " | head -1 | cut -d'|' -f2 | tr -d ' '
elif [ $5 == "setip" ]
	then
	nova --insecure floating-ip-associate $6 $7
fi

