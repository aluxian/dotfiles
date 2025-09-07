# .zshrc = self-contained modular config file with zap plugin manager
# .zshenv = only for secret keys
# .zprofile = not used

export CLICOLOR=1
export EDITOR=vim

ZAP_DIR="$HOME/.local/share/zap"
[ -f "$ZAP_DIR/zap.zsh" ] || git clone -b release-v1 https://github.com/zap-zsh/zap.git "$ZAP_DIR"
source "$ZAP_DIR/zap.zsh"

plug "aluxian/zsh-zsh"
plug "aluxian/zsh-pure-show-stash"
plug "mafredri/zsh-async"
plug "sindresorhus/pure"
plug "aluxian/zsh-do-not-track"
plug "aluxian/zsh-npm"
plug "aluxian/zsh-homebrew"
plug "aluxian/zsh-rclone"
plug "aluxian/zsh-wrangler"
plug "aluxian/zsh-path-vs-code"
plug "aluxian/zsh-path-go"
plug "aluxian/zsh-sponge"
plug "aluxian/zsh-retry"
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
alias gsw='git switch'
alias gd='git diff'
alias gl='git log'
alias gmff='git merge --ff-only'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gcp='git cherry-pick'
alias gsh='git show'
alias gst='git stash'
alias gt='git tag'

alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

alias tf='terraform'

alias ns='npm start'
alias nt='npm test'
alias ni='npm install'
alias nr='npm run'
alias nl='npm run lint'
alias nf='npm run fix'

alias c='claude'
