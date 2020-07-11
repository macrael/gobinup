#!/bin/bash

if [ "$(go env GO111MODULE)" != "on" ]
then
	echo "gobinup requires go module mode to be enabled."
	echo "add \`export GO111MODULE=on\` to your profile"
	exit 1
fi

for gobin in "$(go env GOPATH)"/bin/*
do
	package=$(go version -m "$gobin" | awk 'NR==2 {print $2;}')

	if [ "$package" == "" ] 
	then
		echo "$gobin doesn't have module information compiled in it."
		echo "In order for gobinup to upate it, you need to \`go get\` it in module mode"
	else
		go get -u "$package"
	fi
done
