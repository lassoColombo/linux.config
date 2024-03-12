# copy the active line from the command line buffer
# onto the system clipboard

copybuffer() {
	printf "%s" "$BUFFER" | clipcopy
	notify-send "\"$BUFFER\" copied to clipboard"
}

zle -N copybuffer

bindkey -M emacs "^O" copybuffer
bindkey -M viins "^O" copybuffer
bindkey -M vicmd "^O" copybuffer
