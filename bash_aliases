# PATH
export GOPATH=$HOME/go
export PATH=$HOME/bin:$GOPATH/bin:$HOME/.local/bin:$PATH
# rust
source $HOME/.cargo/env

# git, ghq
function goto-repo {
    repo=$(ghq list | peco)
    if [[ "$repo" == "" ]]; then
        echo "nop"
        return
    fi
    for root in $(ghq root --all); do
        if [[ -d "$root/$repo"  ]]; then
            cd "$root/$repo"
            return
        fi
    done
    echo "nop"
}
alias g='goto-repo'
alias add='git add .'
alias commit='git commit'

alias create='ghq create'
alias status='git status'
alias s='git status'
alias rebase='git rebase -i'
alias get='ghq get'

# text editor
export EDITOR=vim
alias v='vim'

#tmux
function tm() { 
       if [ -n "${1}" ]; then
           tmux attach-session -t ${1} || \
           tmux new-session -s ${1}
    else
           tmux attach-session || \
           tmux new-session
       fi
}
