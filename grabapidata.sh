#!/bin/bash

# Fetch dummy JSON data
json=$(curl -s https://dummyjson.com/products)

# get data in json, since jq cannot access variable
# you echo it and pipe to jq
# jq is a JSON processor
# -r is a flag for "raw output". W/o it there would've been quotation marks aroud every item
# jq accesses products array and loops through every item
# .title = from each item, extract only the title field.
# output is the list of text ilnes; title field PER LINE!!!
# | pipe it to while
# it reads each line, stores it in var title, and runs a command inside do...done
# 
echo "$json" | jq -r '.products[] | .title' | while read -r title; do
    echo "$title"
done
