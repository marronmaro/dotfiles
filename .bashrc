alias vi='vim'
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias rm="rm -i"
alias cp="cp -i"
alias grep='grep --color'
alias fig="docker-compose"
alias less='/usr/share/vim/vim80/macros/less.sh'

if [ -d "${HOME}"/.bashrc.d ]; then
     for f in "${HOME}"/.bashrc.d/*.sh ; do
        source "$f"
     done
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
PS1="[\u@\h \W\$(__git_ps1)] \$ "

export HISTTIMEFORMAT='%Y-%m-%dT%T%z '
