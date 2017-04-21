#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO How to say NVIM running under root user to take config from my main user?

NVIM_CONFIG_DIR=~/.config/nvim
mkdir -p $NVIM_CONFIG_DIR
NVIM_CONFIG=$NVIM_CONFIG_DIR/init.vim
ln -s -f $DIR/init.vim $NVIM_CONFIG

if [ ! -d $NVIM_CONFIG_DIR/plugged ]; then
	mkdir -p $NVIM_DIR/{autoload,plugged}
	curl -sfLo $NVIM_DIR/autoload/plug.vim \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip install --user neovim

	cat << EOF > $DIR/post-install.sh
#!/usr/bin/env bash
nvim -c PlugInstall
rm \${BASH_SOURCE[0]}
EOF
	chmod u+x $DIR/post-install.sh
fi
