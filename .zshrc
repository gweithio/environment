# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="alanpeabody"

echo -ne ""

source $ZSH/oh-my-zsh.sh

plugins=(
    git
    shrink-path
    mercurial
    zsh-syntax-highlighting
    zsh-autosuggestions
)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias notedate="echo $(date +%d-%M-%Y)"
alias tmux='tmux -2'
alias cls=clear
alias gitdiff="gitui"
alias gfg="git log --graph"
alias gfgp="git log --graph --pretty=oneline --abbrev-commit"
alias lzg="lazygit"
alias dev-tmux="/usr/local/bin/dev-tmux"
alias emacs="nvim"
alias gwaith="code"
alias python="python3"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
    --height 40% --layout=reverse --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export DEFAULT_USER="ethan"
export BAT_THEME='zenburn'
export TERM=xterm-256color
export EDITOR=vim

export "PATH=$HOME/bin:$PATH"
#export PATH="/opt/homebrew/Cellar/llvm/16.0.6/bin:$PATH"

[ -f "/Users/sixfourtwelve/.ghcup/env" ] && source "/Users/sixfourtwelve/.ghcup/env" # ghcup-env

export "PATH=$HOME/.local/bin:$PATH"
export "PATH=$HOME/.ghcup/bin:$PATH"
export "PATH=$HOME/.composer/vendor/bin:$PATH"

# bun completions
[ -s "/Users/sixfourtwelve/.bun/_bun" ] && source "/Users/sixfourtwelve/.bun/_bun"

[[ ! -r /Users/sixfourtwelve/.opam/opam-init/init.zsh ]] || source /Users/sixfourtwelve/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/sixfourtwelve/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm end

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@14/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@14/include"
export ODIN_ROOT="/Users/sixfourtwelve/odin"
