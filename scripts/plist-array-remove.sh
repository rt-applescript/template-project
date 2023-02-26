#!/bin/bash

# Usage:
# 	plist-array-append.sh <list-key-name> <new-element-value> <plist-path>

LIST_KEY_NAME=$1
ELEMENT_VALUE=$2
PLIST_PATH=$3

echo $@

if /usr/libexec/PlistBuddy -c "Print ${LIST_KEY_NAME}" "${PLIST_PATH}" | grep -q "${ELEMENT_VALUE}"; then
	index=$(plutil -convert json -o - "${plist_path}" | jq -r --arg value "${search_value}" ".${array_key} | index(\$value)")
	plutil -remove "$LIST_KEY_NAME.$index" $PLIST_PATH


else
	echo "Element not found: $ELEMENT_VALUE";

fi
