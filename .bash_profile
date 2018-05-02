export PATH=/usr/local:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
