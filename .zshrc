export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
#ZSH_THEME="vercel"
ZSH_THEME="apple"

plugins=(git svn mercurial golang)

prompt_svn() {
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [[ $(svn_dirty_choose_pwd 1 0) -eq 1 ]]; then
            prompt_segment yellow black
            echo -n "$rev@$branch"
            echo -n "±"
        else
            prompt_segment green black
            echo -n "$rev@$branch"
        fi
    fi
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on <branch>>\
< at <tags|, >>\
<status|modified|unknown><update><
patches: <patches|join( → )>>" 2>/dev/null
}

build_prompt() {
    RETVAL=$?
    prompt_status
    prompt_context
    prompt_dir
    hg_prompt_info
    prompt_git
    prompt_svn
    prompt_end
}

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR.bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# pnpm
export PNPM_HOME="/Users/ethanmorgan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias g="git"
alias gfg="git log --graph"
alias gfgp="git log --graph --pretty=oneline --abbrev-commit"
alias clearpatch="rm -rf ~/Patches*"

export PATH="$HOME/Odin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="$HOME/odin-source/:$PATH"

eval "$(/Users/ethanmorgan/.local/bin/mise activate zsh)"

eval "$(fzf --zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

[ -f "/Users/ethanmorgan/.ghcup/env" ] && . "/Users/ethanmorgan/.ghcup/env" # ghcup-env

[[ ! -r /Users/ethanmorgan/.opam/opam-init/init.zsh ]] || source /Users/ethanmorgan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


export PATH="/opt/homebrew/Cellar/llvm/17.0.6_1/bin${PATH:+:${PATH}}"
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man

## Email stuff
alias mbsync="mbsync -c ~/.mbsyncrc"
alias tokensync="mutt_oauth2.py --verbose --authorize ethan@gweithio.tokens"
export GPG_TTY=$(tty)
export PAGER=most
export ANDROID_HOME='/Users/ethanmorgan/Library/Android/sdk'

export PATH=/Users/ethanmorgan/.cache/rebar3/bin:$PATH

alias soft="ssh soft"

function soft-remote () {
  eval "$(git remote add soft ssh://git.gweithio.com:23231/$1)"
}

export TERM=xterm-256color

export USER="ethan"
