# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$(python3 -m site --user-base)/bin:$PATH

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Powerlevel10k
zinit ice depth"1" lucid
zinit light romkatv/powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autosuggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#cba6f7
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=orange
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=orange

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(jenv init -)"
### End of Zinit's installer chunk

export EDITOR=nvim
eval "$(jenv init -)"

# aliases
alias k="kubectl"

# k8s command
knsset() {
    kubectl config set-context --current --namespace=$1
}

knsget() {
  local namespace
  namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}')
  if [[ -z "$namespace" ]]; then
    echo "default"
  else
    echo "$namespace"
  fi
}

kns() {
    ns=$(k get ns | awk 'NR > 1 {print $1}' | sort | fzf --header="Select namespace")
    if [ -n "$ns" ]; then
        kubectl config set-context --current --namespace=$ns
    fi
}

ka() {
    command=$1
    resource=$2
    names=$(k get $resource | awk 'NR > 1 {print $1}' | fzf -m --header="Pick resources")
    if [ -n "$names" ]; then
        echo "running: kubectl $command $resource $names"
        kubectl $command $resource $names
    fi
}

klog() {
    pod=$(kubectl get pods --all-namespaces -o custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace --no-headers | fzf --header="Select a pod to tail logs")
    if [ -z "$pod" ]; then
        echo "No pod selected."
        return
    fi
    namespace=$(echo $pod | awk '{print $2}')
    pod_name=$(echo $pod | awk '{print $1}')
    kubectl logs -f -n $namespace $pod_name | tspin
}

kctx() {
    cluster=$(kubectl config get-contexts | awk 'NR > 1 {print $2}' | sort | uniq | fzf --header="Select cluster to set in kubectl context")
    if [ -n "$cluster" ]; then
        kubectl config use-context $cluster
    fi
}
