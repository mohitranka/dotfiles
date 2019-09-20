# .bashrc # If not running interactively, don't do anything
[[ $- != *i* ]] && return
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  tmux attach || exec tmux new-session;
#fi
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
#export PS1="\[\e[0;32m \$PS1_PATH\$(parse_git_branch)\e[m $ "
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

# Add go bin path, if available
if command -v go > /dev/null 2>&1; then
    export PATH=$PATH:`go env GOPATH`/bin
fi

# Add $HOME/bin to $PATH if does not exists

if ! [[ ":$PATH:" == *"$HOME/bin"* ]]; then
    export PATH=$PATH:$HOME/bin
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# color man page

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# History information

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

## Notes with fzf
export NOTES=$HOME/Dropbox/notes
export GO111MODULE=on
## Extract any archieve

extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

git_push_dotfiles() {
    [ -d "$HOME/.dotfiles" ] && git_automated_push $HOME/.dotfiles
}

git_automated_push() {
    if (( "$#" < 1)); then
        echo "git_automated_push requires git root directory as input";
    else
        if [ "$SILENT_EXIT" != 1 ]; then
            git_root=$1;
            cd $git_root;
            if [[ `git status --porcelain` ]]; then
                git add .
                git commit -am"[Automated commit] `date -u`"
                git push origin master
            fi
        else
            echo "Not pushing changes to remote";
        fi
    fi
}

clean_current_song() {
    rm -rf /tmp/current_song ;
}

cleanup() {
    git_push_dotfiles;
    rm -rf 60;
    clean_current_song;
}

trap cleanup EXIT
