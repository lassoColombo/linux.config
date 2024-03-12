fman() {
	manlist=$(man -k . 2>/dev/null | awk 'BEGIN {FS=OFS="- "} /\([1|4]\)/ {gsub(/\([0-9]\)/, "", $1); if (!seen[$0]++) { print }}' | fzf) &&
		man "$(echo "$manlist" | awk -F' |,' '{print $1}')" &&
		unset manlist
}
fenv() {
	var=$(printenv | cut -d= -f1 | fzf) &&
		echo "$var=$(printenv "$var")" &&
		unset var
}
