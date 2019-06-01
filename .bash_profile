export DEVPATH=$HOME/dev
export GOPATH=$HOME/go

export SHAREPATH=${SHAREPATH-$PATH};

PATH=$SHAREPATH
PATH=$SHAREPATH:$HOME/Library/Python/2.7/bin

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
