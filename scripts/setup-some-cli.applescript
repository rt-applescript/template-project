#!/usr/bin/osascript

(* Browse the CLI into config so it can be referenced by user scripts. *)

set chosenCli to choose file with prompt "Please select the <app-name> CLI:" default location POSIX file "/usr/local/bin/<app-name>"
do shell script "plutil -replace 'App Name CLI' -string \"" & (POSIX path of chosenCli) & "\" ~/applescript-core/config-system.plist"
