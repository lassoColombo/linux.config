typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#B51010' # - unknown tokens / errors
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#ED24E5' # - shell reserved words (if, for)
ZSH_HIGHLIGHT_STYLES[alias]='fg=#CC8EF2' # - aliases
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#C724ED' # - suffix aliases (requires zsh 5.1.1 or newer)
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#C724ED' # - global aliases
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#C724ED' # - shell builtin commands (shift, pwd, zstyle)
ZSH_HIGHLIGHT_STYLES[function]='fg=#65EC6A' # - function names
ZSH_HIGHLIGHT_STYLES[command]='fg=#65EC6A' # - command names
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#65EC6A' # - precommand modifiers (e.g., noglob, builtin)
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#65EC6A' # - command separation tokens (;, &&)
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#C724ED' # - hashed commands
ZSH_HIGHLIGHT_STYLES[path]='fg=#23ADDE' # - existing filenames
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#23ADDE' # - prefixes of existing filenames
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#9723DE' # - globbing expressions (*.txt)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#E935B5' # - history expansion expressions (!foo and ^foo^bar)
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#E9E435' # - command substitutions ($(echo foo))
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=#E9E435' # - an unquoted command substitution ($(echo foo))
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#E9E435' # - a quoted command substitution ("$(echo foo)")
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#E9E435' # - command substitution delimiters ($( and ))
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#E9E435' # - an unquoted command substitution delimiters ($( and ))
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#E9E435' # - a quoted command substitution delimiters ("$( and )")
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=#E9E435' # - process substitutions (<(echo foo))
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#E9E435' # - process substitution delimiters (<( and ))
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#35E5E9' # - arithmetic expansion $(( 42 )))
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#8EE6B2' # - single-hyphen options (-o)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#8EE6B2' # - double-hyphen options (--option)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#FBE98A' # - backtick command substitution (`foo`)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FBE98A' # - unclosed backtick command substitution (`foo)
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#FBE98A' # - backtick command substitution delimiters (`)
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#FBE98A' # - single-quoted arguments ('foo')
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FBE98A' # - unclosed single-quoted arguments ('foo)
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#FBE98A' # - double-quoted arguments ("foo")
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FBE98A' # - unclosed double-quoted arguments ("foo)
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#FBE98A' # - dollar-quoted arguments ($'foo')
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FBE98A' # - unclosed dollar-quoted arguments ($'foo)
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#FBE98A' # - two single quotes inside single quotes when the RC_QUOTES option is set ('foo''bar')
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#FBE98A' # - parameter expansion inside double quotes ($foo inside "")
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#FBE98A' # - backslash escape sequences inside double-quoted arguments (\" in "foo\"bar")
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#FBE98A' # - backslash escape sequences inside dollar-quoted arguments (\x in $'\x48')
ZSH_HIGHLIGHT_STYLES[assign]='fg=#BDEC89' # - parameter assignments (x=foo and x=( ))
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#FF1616' # - redirection operators (<, >, etc)
ZSH_HIGHLIGHT_STYLES[comment]='fg=#15A1A4' # - comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
ZSH_HIGHLIGHT_STYLES[comment]='fg=#15A1A4' # - elided parameters in command position ($x ls when $x is unset or empty)
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#E935B5' # - named file descriptor (the fd in echo foo {fd}>&2)
ZSH_HIGHLIGHT_STYLES[default]='fg=#D7F2F2' # - everything else
