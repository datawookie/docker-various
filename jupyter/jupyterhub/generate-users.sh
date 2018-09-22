#!/bin/bash

case $1 in
    ''|*[!0-9]*) echo "How many users do you want to generate?"; exit 1 ;;
esac

echo "Generating $1 new users."

for n in $(seq $1)
do
	username=$(printf "user_%02x" $n)
	password=$(apg -n 1 -m 8 -M SC -E ';' -c /dev/urandom)
	echo "$n;$username;$password"
#	useradd $username -m -p `mkpasswd $password` -s /bin/bash
done
