[ -f ~/.zprofile ] && source ~/.zprofile

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Automatically update oh-my-zsh
zstyle ':omz:update' mode auto

# Enable command auto-correction
ENABLE_CORRECTION="false"

# Enable red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias python=python3

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export EDITOR="code --wait"

# disable zsh auto correction
unsetopt correct_all