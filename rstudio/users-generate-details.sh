#!/bin/bash

# - Generate usernames and passwords.
#
# $ ./users-generate-details.sh 15
#
# Using openssl rather than apg to generate passwords since the latter relies
# on /dev/urandom which, in turn, requires entropy... and that can be in short
# supply on Droplets.
#
# These are some options for generating more imaginative usernames:
#
# - https://github.com/jjmontesl/codenamize
# - https://frightanic.com/goodies_content/docker-names.php
# - https://github.com/moby/moby/tree/master/pkg/namesgenerator

UID0=3000

echo "uid,username,passwd"

for n in `seq --format=%03g $1`
do
	uid=`echo "$UID0 + $n" | bc`
	#
	user="U$uid"
	pass=`openssl rand -base64 6 2>/dev/null`
	# Record username and password.
	echo "$uid,$user,$pass"
done
