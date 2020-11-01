# PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/.local/bin

# git, ghq
function goto-repo {
    repo=$(ghq list | peco)
    if [[ "$repo" == "" ]]; then
        echo "nop"
        return
    fi
    cd "$(ghq root)/$repo"
}
alias g='goto-repo'
alias add='git add .'
alias commit='git commit'

function create {
    if [[ "$1" == "" ]]; then
        return
    fi
    ghq create lunashade/$1
}

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

# X Server
export DISPLAY=localhost:0.0
export "LIBGL_ALWAYS_INDIRECT=1"
