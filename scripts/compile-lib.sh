#!/bin/bash

# Caveat, uses simple workaround for names with spaces. Can have as many as 9 spaces.
INPUT_FILE_PATH=$(echo "$1 $2 $3 $4 $5 $6 $7 $8 $9" | sed 's/ *$//')
DEPLOY_PATH=~/Library/Script\ Libraries/"$BASEFILENAME.scpt"
osacompile -o "${DEPLOY_PATH}" "${INPUT_FILE_PATH}.applescript"
