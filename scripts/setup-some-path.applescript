#!/usr/bin/osascript

(* 
	Browse a folder so it can referenced by user from a config. 
	
	@Uninstall:
		plutil -remove 'Temporary Path' ~/applescript-core/config-user.plist
*)

set username to short user name of (system info)
set FOLDER_PATH_KEY to "Temporary Path"
set PLIST_PATH to "~/applescript-core/config-user.plist"

set currentPath to missing value
try
	set currentPath to do shell script "plutil -extract '" & FOLDER_PATH_KEY & "' raw $PLIST_PATH"
end try

if currentPath is not missing value and currentPath is not "" then
	set defaultPosixPath to currentPath
else
	set defaultPosixPath to "/Users/" & username
end if

set chosenFolder to choose folder with prompt "Please select a folder:" default location POSIX file defaultPosixPath
set posixPath to (POSIX path of chosenFolder)

if posixPath ends with "/" and length of posixPath is greater than 1 then set posixPath to text 1 thru -2 of posixPath

do shell script "plutil -replace '" & FOLDER_PATH_KEY & "' -string \"" & posixPath & "\" $PLIST_PATH"
