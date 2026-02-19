# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# p10k
zinit ice depth"1" lucid; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light ptavares/zsh-direnv
zinit light Aloxaf/fzf-tab

zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin

zinit ice depth"1" lucid; zinit light jeffreytse/zsh-vi-mode
# need this so atuin keybind doesn't get overridden by zvm
function zvm_after_init() {
    bindkey '^R' atuin-search
}

# Oh My Zsh snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::colored-man-pages
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx

# HISTORY (optimized for high context retention)
HISTFILE=~/.zsh_history
HISTSIZE=50000                # Increase the number of commands to remember in memory
SAVEHIST=$HISTSIZE            # Increase the number of commands to save in the history file
HISTDUP=erase                 # Erase duplicate history
setopt HIST_IGNORE_DUPS       # Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate commands and keep the most recent
setopt HIST_FIND_NO_DUPS      # Do not display duplicates when searching history
setopt HIST_SAVE_NO_DUPS      # Do not write duplicate commands to the history file
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt SHARE_HISTORY          # Share history across all zsh sessions
setopt INC_APPEND_HISTORY     # Append commands to history file incrementally
setopt EXTENDED_HISTORY       # Save the timestamp of commands in the history file
setopt APPEND_HISTORY         # Save the timestamp of commands in the history file

# Styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# path
addToPath() {
    PATH="$1:$PATH"
}
addToPath "/opt/homebrew/opt/libpq/bin"
addToPath "/opt/homebrew/bin"
addToPath "$HOME/.jenv/bin"
addToPath "/usr/local/opt/llvm/bin"

# exports
export FZF_TMUX_OPTS='-p80%,60%'
#export FZF_DEFAULT_OPTS=" \
#    --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
#    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
#    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export EDITOR="nvim"     
export K9S_EDITOR="nvim"    # option for k9s
export KUBE_EDITOR="nvim"   # option for k9s
export XDG_CONFIG_HOME="$HOME/.config"
export ZVM_VI_EDITOR="nvim"

# Source all .sh files from ~/.zshrc.d
if [ -d "$HOME/.zshrc.d" ]; then
  for file in "$HOME/.zshrc.d"/*.sh; do
    [ -r "$file" ] && source "$file"
  done
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
