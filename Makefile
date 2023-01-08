help:
	@echo "make install - Create config files, assets, and install essential
	libraries."

	@echo "make install - install the core AppleScript libraries in the current
		user's Library/Script Library folder and run user prompts as needed"
	@echo "make compile-all - compile all scripts on this project"
	@echo "make compile-lib - compiles a script library.  e.g. make compile-lib SOURCE=src/std"
	@echo "-s option hides the Make invocation command."

# Simplify to pick all files inside src folder.
SRC_LIBS := your-lib

$(SRC_LIBS): Makefile
	./scripts/compile-lib.sh src/$@

# May include user prompts
install: $(SRC_LIBS)
	mkdir -p ~/applescript-core/app-new
	cp -n plist.template ~/applescript-core/config-<your-lib>.plist || true

	osascript scripts/register-project.applescript

uninstall:
	# TODO


register:
	osascript scripts/register-project.applescript

unregister:
	plutil -remove 'Project applescript-<new>' ~/applescript-core/config-user.plist
	grep -v '<string>Project applescript-<new></string>' ~/applescript-core/config-user.plist > tmpfile && mv tmpfile ~/applescript-core/config-user.plist


compile-all:

test:

compile-lib:
	./scripts/compile-lib.sh $(SOURCE)

compile-bundle:
	./scripts/compile-bundle.sh $(SOURCE)


reveal-config:
	open ~/applescript-core

reveal-lib:
	open ~/Library/Script\ Libraries
