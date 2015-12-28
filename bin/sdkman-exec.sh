#!/bin/bash

# A quick wrapper to source the gvm env and run a command
# This is used to run sdkman in Dockerfile RUN commands
# since the RUN commands does not use interactive shells

if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then

	 cat /usr/local/bin/sdkman.config >> $HOME/.sdkman/etc/config	
	
	 source "$HOME/.sdkman/bin/sdkman-init.sh"

	 if [ -n "$CANDIDATE" -a -n "$VERSION" ]; then
	 	sdk install $CANDIDATE $VERSION
	 	sdk default $CANDIDATE $VERSION
	 else 
	 	echo >&2 'There are no installations specified for sdkman to install. '
		echo >&2 'If you want to install a library sepcify both the CANDIDATE and VERSION environment variables.'
		echo >&2 'Skipping installations!'	
	 fi		
else 
	echo >&2 "No sdkman installation found at $HOME/.sdkman/bin/sdkman-init"	 
fi	 

exec "$@"