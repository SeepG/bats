#!/bin/zsh

# set -x checks each line output

file=$2

# z checks if variable is empty string or not, default is list.txt
if [[ -z $file ]]; then 
     file="list.txt"
fi

if [[ -z $1 ]]; then 
     echo "Default url doesn't exit"
     exit 1
fi

curl $1 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u > $file

# grep -n http $file