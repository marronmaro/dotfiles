export PATH=/usr/local:$PATH

export DEVPATH=$HOME/dev
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=~/Library/Python/2.7/bin:$PATH

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
