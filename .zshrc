# Path to your oh-my-zsh installation.
export ZSH=/Users/dmitrychopey/.oh-my-zsh
export LANG=en_US.UTF-8
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, z)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"
alias gst="git status"
alias gcam="git commit -a -m"
alias master="git checkout master"
alias apic="exec api rails c"
alias gc="git checkout"
alias gp="git pull"
alias gpo="git push origin"
alias gsearch="git log --pretty=oneline | fzf" #Need to install fzf first

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function kpods() {
	kubectl -n $1 get all
}

function kshell() {
	local service="$1"
	local branch="$2"
	local pod=$(getpod "$service" "$branch")
        kubectl -n "$branch" exec -it "$pod" -- bash
}

function klogs() {
	local service="$1"
        local branch="$2"
        local pod=$(getpod "$service" "$branch")
        kubectl -n "$branch" logs "$pod"
}

function klogsf() {
	local service="$1"
        local branch="$2"
        local pod=$(getpod "$service" "$branch")
        kubectl -n "$branch" logs "$pod" -f
}

function getpod(){
	 local service="$1"
 	 local branch="$2"

         kubectl -n "$branch" get all 2>/dev/null | \
         grep 'pod/'"$service-$branch"'.*Running' | \
 	 grep -o "$service-$branch"'-[^ ]*'
}

function getpod_prod(){
	 local service="$1"

         kubectl -n master get all 2>/dev/null | \
         grep 'pod/'"$service-public"'.*Running' | \
 	 grep -o "$service-public"'-[^ ]*' | head -1
}

function kubpsql () {
  pod=$(kubectl -n $1 get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $2-$1 | head -n 1)
  kubectl -n $1 exec -it $pod -- sh -c 'psql postgres://$DB_USERNAME:$DB_PASSWORD@$DB_HOST/$DB_NAME'
}

export BUNDLER_EDITOR="atom"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:/usr/local/Cellar/vim/8.1.0600
export PATH="$PATH:/Users/dmitrychopey/Development/flutter/bin"
export GOPATH=/Users/dmitrychopey/go
export GOPRIVATE=gitlab.qonto.co/cbs
export PATH=$PATH:$GOPATH/bin

# Docker
export COMPOSE_TLS_VERSION=TLSv1_2

# Pure promtp https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
