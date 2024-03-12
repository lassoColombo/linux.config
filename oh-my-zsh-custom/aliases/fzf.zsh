alias fcd='cd $(find * -type d 2>/dev/null | fzf +m)'
alias fv='nvim $(find * -type f 2>/dev/null | fzf +m)'
alias fpkill='ps aux | fzf -m | awk '{print $2}' | xargs kill'
