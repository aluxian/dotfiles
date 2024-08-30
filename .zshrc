export CLICOLOR=1
export EDITOR=vim

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
HISTSIZE=10000 # zsh
SAVEHIST=10000 # zsh

setopt SHARE_HISTORY          # Share command history with other Zsh sessions
setopt HIST_IGNORE_ALL_DUPS   # Don't save duplicate entries in history
setopt HIST_IGNORE_SPACE      # Don't save commands starting with a space
setopt INTERACTIVE_COMMENTS   # Allow use of comments in interactive code
setopt NO_FLOW_CONTROL        # Disable flow control using Ctrl-S and Ctrl-Q
setopt EMACS                  # Explicitly set Emacs-style line editing (fix VS Code)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # zsh: case-insensitive completion style
zstyle :prompt:pure:git:stash show yes # pure: turn on git stash status

ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
[ -f "${ZAP_DIR}/zap.zsh" ] || git clone -b release-v1 https://github.com/zap-zsh/zap.git "${ZAP_DIR}"
source "${ZAP_DIR}/zap.zsh"

plug "mafredri/zsh-async"
plug "sindresorhus/pure"
plug "aluxian/zsh-async-disable-npm-fund"
plug "aluxian/zsh-async-disable-npm-update-notifier"
plug "aluxian/zsh-sponge"
plug "aluxian/zsh-retry"
plug "aluxian/zsh-trash"
plug "aluxian/zsh-hushlogin"
plug "aluxian/zsh-ctrl-x-e"
plug "aluxian/zsh-ctrl-t" 
plug "aluxian/zsh-app-cleaner"
plug "aluxian/zsh-pet"
plug "aluxian/zsh-gpt"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

autoload -Uz compinit
compinit

# .vimrc
if [ ! -f ~/.vimrc ]; then
  cat << 'EOF' > ~/.vimrc
" DO NOT MODIFY

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dadbod'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

set nocompatible

filetype plugin on
filetype indent on
syntax on
colorscheme gruvbox

set rtp+=/usr/local/opt/fzf

set ignorecase
set smartcase

set lazyredraw

set clipboard=unnamed
set autoread

set autoindent
set backspace=indent,eol,start
set complete-=i

set number
set ruler

set updatetime=500

set laststatus=2

set exrc
set secure

set background=dark

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

let g:lightline = {'colorscheme': 'gruvbox'}
EOF
  echo ".vimrc created"
fi

# .zprofile
if [ ! -f ~/.zprofile ]; then
  cat << 'EOF' > ~/.zprofile
# DO NOT MODIFY

# Go
export PATH="$GOBIN:$PATH"

# Cargo
export PATH="$CARGO_HOME/bin:$PATH"
EOF
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cat << 'EOF' >> ~/.zprofile

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Visual Studio Code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
EOF
  fi
  echo ".zprofile created, restart shell to apply changes"
fi

# .zshenv
if [ ! -f ~/.zshenv ]; then
  cat << 'EOF' > ~/.zshenv
# DO NOT MODIFY

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Go
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

# fzf
export FZF_DEFAULT_OPTS='--color 16'
EOF
  echo ".zshenv created, restart shell to apply changes"
fi

# .config/git/config
if [ ! -f ~/.config/git/config ]; then
  cat << 'EOF' > ~/.config/git/config
[advice]
	statusHints = false
	addEmptyPathspec = false
[user]
	name = Alexandru Rosianu
	signingKey = 4F2278A449898F36642A3216D31D323223736BFC
	email = me@aluxian.com
[core]
	autocrlf = input
[pull]
	ff = only
[init]
	defaultBranch = main
[help]
	autocorrect = immediate
[push]
	autoSetupRemote = true
EOF
  echo ".config/git/config created"
fi


function async() {
  local job_func_name=$1
  if [[ ! $job_func_name =~ ^[a-zA-Z0-9_]+$ ]]; then
    echo "async: job_func_name must be an alphanumeric string with no spaces and only underscores"
    return 1
  fi
  async_start_worker $job_func_name
  async_job $job_func_name $job_func_name
}

alias ll='ls -lh'
alias la='ls -alh'
alias bi='brew install'
alias bu='brew upgrade'
alias dk='docker'
alias dc='docker compose'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch --sort=-committerdate'
alias gc='git commit'
alias gam='git commit --amend'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gm='git merge'
alias gmff='git merge --ff-only'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpsom='git push --set-upstream origin master'
alias gpsup='git push --set-upstream origin (git symbolic-ref --short HEAD)'
alias gs='git status'
alias gcp='git cherry-pick'
alias gsh='git show'
alias gt='git tag'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias tf='terraform'
alias barc='brew autoremove && brew cleanup'
alias c='cat'
alias nr='npm run'
alias nl='npm run lint'
alias ns='npm start'
alias nt='npm test'
alias ntw='npm test -- --watch'
alias npr='npm prune'

bindkey "\e[3~" delete-char # fix Fn+Backspace inside VS Code integrated terminal

export RCLONE_FAST_LIST=1
