# BEGIN PROVISIONER ADDED ENVIRONMENT SETTINGS

PATH=/opt/bitnami/apache/bin:/opt/bitnami/apache2/bin:/opt/bitnami/common/bin:/opt/bitnami/git/bin:/opt/bitnami/gonit/bin:/opt/bitnami/node/bin:/opt/bitnami/python/bin:/opt/bitnami/redis/bin:/opt/bitnami/nami/bin:$PATH
export PATH

# BEGIN BITNAMI IMAGE METADATA SETTINGS
export OS_ARCH=amd64
export OS_FLAVOUR=debian-10
export OS_NAME=linux
export BITNAMI_APP_NAME=node
export BITNAMI_IMAGE_VERSION=12.20.2
# END BITNAMI IMAGE METADATA SETTINGS

setopt share_history # share command history with other zsh sessions
setopt histignorealldups # don't save duplicate entries in history
setopt histignorespace # don't save commands starting with a space
setopt interactivecomments # allow use of comments in interactive code

zstyle :prompt:pure:git:stash show yes # turn on git stash status

#if ! command -v brew &>/dev/null; then
#	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#fi

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
	command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
		print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
		print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zinit ice
zinit light aluxian/zsh-pet

zinit ice wait lucid blockf
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

zinit ice wait lucid blockf
zinit snippet OMZ::plugins/gcloud/gcloud.plugin.zsh

zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid as'program' pick'bin/git-dsf'
zinit light zdharma/zsh-diff-so-fancy

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting

alias ll='ls -lh'
alias la='ls -alh'
alias bi='brew install'
alias bu='brew upgrade'
alias dk='docker'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch --sort=-committerdate'
alias gc='git commit'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpsom='git push --set-upstream origin master'
alias gpsup='git push --set-upstream origin (git symbolic-ref --short HEAD)'
alias gs='git status'
alias gsh='git show'
alias gt='git tag'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias tf='terraform'
