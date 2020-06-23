#!/bin/bash

main() {
	PKG=$(tlmgr search --file --global "${1}" | fzf --layout=reverse)
	echo "Installing ${PKG%?}"
	tlmgr install ${PKG%?}
}


if [[ $# -eq 0 ]] ; then
    echo 'No package provided'
    exit 1
else
	main $1
fi
