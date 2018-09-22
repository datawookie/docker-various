#!/bin/bash

# The container name.
#
name=$1

docker exec rstudio mkdir -p /home/rstudio/users

grep -v "^uid" | while IFS=, read uid user pass
do
	docker exec $name adduser $user --home /home/rstudio/users/$user --gecos '' --disabled-password --force-badname --quiet
	docker exec $name sh -c "echo $user:$pass | chpasswd"
done
