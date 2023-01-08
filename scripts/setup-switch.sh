#!/bin/bash

# Adds a switch into switches.plist

NEW_SWITCH_NAME="New Switch Name"
NEW_SWITCH=$(plutil -extract $NEW_SWITCH_NAME raw ~/applescript-core/switches.plist)

if [[ $NEW_SWITCH == *"error"* ]];
then
    echo "Installing required plist keys..."
	plutil -replace "$NEW_SWITCH_NAME" -bool false ~/applescript-core/switches.plist

	SWITCHES=$(plutil -extract "Switches" raw ~/applescript-core/config-user.plist)
	if [[ $SWITCHES == *"error"* ]];
	then
		plutil -replace 'Switches' -xml '<array></array>' ~/applescript-core/config-user.plist
	fi
	plutil -insert 'Switches' -string "$NEW_SWITCH_NAME" -append ~/applescript-core/config-user.plist
    echo "Done"
else
    echo "Required Keys are already installed"
fi
