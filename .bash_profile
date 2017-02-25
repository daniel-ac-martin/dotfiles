# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/.local/bin:$HOME/bin:$PATH:$HOME/.cabal/bin:$HOME/.gopath/bin
INFOPATH=$HOME/.local/info:$INFOPATH
PKG_CONFIG_PATH=$HOME/.local/lib64/pkgconfig:$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

export PATH
export INFOPATH
export PKG_CONFIG_PATH

export EDITOR="vi"
