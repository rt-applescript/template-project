(*
	This script is used to add the current project into the config-user so that
	the "Create Automator App" and "Create Voice Command App" can determine 
	where to link to the local scripts.

	Checks the config-user.plist then adds this project key and path if it is 
	not yet registered. 

	NO USER INTERACTION on this script.
	
	@Plist:
		config-user.plist
		
	@Plist Keys
		AppleScript Projects (list)
		Project applescript-notes (string)
		
*)
set projectKey to "Project template-applescript-project"

set std to script "std"
set logger to std's import("logger")'s new("register-project")
set plutil to std's import("plutil")'s new()

set textUtil to std's import("string")
set listUtil to std's import("list")

set configUser to plutil's new("config-user")
if configUser's hasValue(projectKey) then
	logger's infof("The project: {} is already registered", projectKey)
	return
end if


tell application "System Events"
	set posixPath to POSIX path of (path to me)
end tell

set projectPath to textUtil's replace(result, "/scripts/register-project.applescript", "")
configUser's setValue(projectKey, projectPath)

set projectList to configUser's getList("AppleScript Projects")
if projectList is missing value then set projectList to {}
set end of projectList to projectKey
configUser's setValue("AppleScript Projects", projectList)
logger's infof("The project: {} is now registered", projectPath)
