#!/usr/bin/bash

# it's better to use st here (starts a lot faster than pretty much everything else)
# the ugly printf | sed thing is here to make args with quotes work.
# (e.g. --preview='echo {1}').
# sadly we can't use "$@" here directly because we are inside sh -c "..." call
# already.
# you can also set window dimensions via -g '=COLSxROWS', see man st.
st -f "Hack-12" -g  100x20+397+100 -e /home/meme/bin/fzf-op.sh 2>/dev/null 

# handle ctrl+c outside child terminal window
#trap "kill $! 2>/dev/null; rm -f $input $output" EXIT

