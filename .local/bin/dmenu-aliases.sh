#!/bin/bash
cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
AL="$HOME/.aliasrc"

if [ -d "$cachedir" ]; then
	cache=$cachedir/dmenu_run
else
	cache=$HOME/.dmenu_cache # if no xdg dir, fall back to dotfile in ~
fi

if [ -f $AL ]; then
  aliases=( $AL )
fi

if [ ~/.bash_functions ]; then
  functions=( ~/.bash_functions )
fi

source $aliases

cmd=`(
	IFS=:
 if stest -dqr -n "$cache" $PATH || stest -fqr -n "$cache" "$aliases" || stest -fqr -n "$cache" "$functions"; then
          (
            stest -flx $PATH
	    	alias | awk -F '[ =]' '{print $2}'
	    	compgen -A function
          ) | sort -u | tee "$cache" | dmenu "$@"
	else
		dmenu "$@" < "$cache"
	fi
)`

if [ -f $AL ]; then
	if [ ! -z "$(grep '^alias' $aliases|cut -d'=' -f1|grep $cmd)" ] || [ -z $(which $cmd) ]; then
		echo -e "source $AL \n $cmd" | bash -O expand_aliases &
	else
		exec $cmd &
	fi
fi
