# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Source aliases
if [ -f ~/.alias ]; then
. ~/.alias
fi
export EDITOR=vim
# User specific aliases and functions
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PROMPT_COMMAND='PS1_PATH=$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<< ${PWD/#$HOME/\~})'
export PS1="\u@\h:\[\e[0;32m \$PS1_PATH\$(parse_git_branch)\e[m $ "
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[[ -r "/usr/local/bin/z.sh" ]] && . "/usr/local/bin/z.sh" 



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mohit/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mohit/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mohit/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mohit/Downloads/google-cloud-sdk/completion.bash.inc'; fi

if command -v fzf >/dev/null 2>&1; then

    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi


if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

export LC_ALL=en_US.UTF-8
