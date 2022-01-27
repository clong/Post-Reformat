# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/bin:$PATH:/usr/local/go/bin:/Users/clong/Library/Python/3.7/bin:/var/root/Library/Python/3.7/bin"
export GOPATH="/Users/clong/go"
export LESS=' -R -X -E '
export EDITOR="/usr/local/bin/nano"
export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # Fix for some Ansible issues
export EDITOR="/usr/local/bin/nano"
# zsh_history
export HISTFILE=~/.zsh_history
export HIST_STAMPS="[%F %T]"
export HISTCONTROL=ignoreboth
export HISTSIZE="500000"
export HISTFILESIZE="500000"
export SAVEHIST=$HISTSIZE

# Path to your oh-my-zsh installation.
export ZSH="/Users/clong/.oh-my-zsh"
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# I still want my bash aliases
source ~/.bash_aliases

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/clong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/clong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/clong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/clong/google-cloud-sdk/completion.zsh.inc'; fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
# Source other stuff
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
