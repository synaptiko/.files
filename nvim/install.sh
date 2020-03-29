#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$USER" == "root" ]; then
	mkdir -p ~/.config
	ln -s -f `realpath $DIR/../../.config/nvim` ~/.config/nvim
	exit
fi

systemctl --user daemon-reload

if ! sudo systemctl --global is-enabled synaptiko-ownvim.socket >& /dev/null; then
	sudo systemctl --global enable synaptiko-ownvim.socket
fi
if ! systemctl --user is-active synaptiko-ownvim.socket >& /dev/null; then
	systemctl --user start synaptiko-ownvim.socket
fi

NVIM_CONFIG_DIR=~/.config/nvim
mkdir -p $NVIM_CONFIG_DIR
NVIM_CONFIG=$NVIM_CONFIG_DIR/init.vim
ln -s -f $DIR/init.vim $NVIM_CONFIG

mkdir -p $NVIM_CONFIG_DIR/lua/navigation
ln -s -f $DIR/lua/navigation/init.lua $NVIM_CONFIG_DIR/lua/navigation/init.lua

if [ ! -d $NVIM_CONFIG_DIR/plugged ]; then
	mkdir -p $NVIM_CONFIG_DIR/{autoload,plugged}
	curl -sfLo $NVIM_CONFIG_DIR/autoload/plug.vim \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip install -U --user neovim

	cat << EOF > $DIR/post-install.sh
#!/usr/bin/env bash
nvim --headless -c PlugInstall -c qa
rm \${BASH_SOURCE[0]}
EOF
	chmod u+x $DIR/post-install.sh
fi

# to support ConvertThroughLodash functionality: CamelCase, KebabCase etc.
yarn global add lodash

# to support Node.js plugins (yarn cannot be simply used)
sudo npm install -g neovim
