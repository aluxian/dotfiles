export CLICOLOR=1
export EDITOR=vim

export FZF_DEFAULT_OPTS='--color 16'
export RCLONE_FAST_LIST=1

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY          # Share command history with other Zsh sessions
setopt HIST_IGNORE_ALL_DUPS   # Don't save duplicate entries in history
setopt HIST_IGNORE_SPACE      # Don't save commands starting with a space
setopt INTERACTIVE_COMMENTS   # Allow use of comments in interactive code
setopt NO_FLOW_CONTROL        # Disable flow control using Ctrl-S and Ctrl-Q
setopt EMACS                  # Explicitly set Emacs-style line editing (fix VS Code)

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :prompt:pure:git:stash show yes # pure: turn on git stash status

bindkey "\e[3~" delete-char # fix Fn+Backspace inside VS Code integrated terminal

ZAP_DIR="$HOME/.local/share/zap"
[ -f "$ZAP_DIR/zap.zsh" ] || git clone -b release-v1 https://github.com/zap-zsh/zap.git "$ZAP_DIR"
source "$ZAP_DIR/zap.zsh"

plug "mafredri/zsh-async"
plug "sindresorhus/pure"
plug "aluxian/zsh-async-disable-npm-fund"
plug "aluxian/zsh-async-disable-npm-update-notifier"
plug "aluxian/zsh-homebrew"
plug "aluxian/zsh-path-vs-code"
plug "aluxian/zsh-path-go"
plug "aluxian/zsh-sponge"
plug "aluxian/zsh-retry"
plug "aluxian/zsh-trash"
plug "aluxian/zsh-hushlogin"
plug "aluxian/zsh-ctrl-x-e"
plug "aluxian/zsh-ctrl-t" 
plug "aluxian/zsh-app-cleaner"
plug "aluxian/zsh-pet"
plug "aluxian/zsh-gpt"
plug "aluxian/zsh-compinit"
plug "Aloxaf/fzf-tab"
plug "joshskidmore/zsh-fzf-history-search"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

alias ll='ls -lh'
alias la='ls -alh'

alias dk='docker'
alias dc='docker compose'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gc='git commit'
alias gam='git commit --amend'
alias gb='git branch --sort=-committerdate'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gmff='git merge --ff-only'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gcp='git cherry-pick'
alias gsh='git show'
alias gt='git tag'

alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

alias tf='terraform'

alias nr='npm run'
alias nl='npm run lint'
alias ns='npm start'
alias nt='npm test'
alias ntw='npm test -- --watch'
