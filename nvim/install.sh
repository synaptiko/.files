#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$USER" == "root" ]; then
	mkdir -p ~/.config
	ln -s -f `realpath $DIR/../../.config/nvim` ~/.config/nvim
	exit
fi

NVIM_CONFIG_DIR=~/.config/nvim
mkdir -p $NVIM_CONFIG_DIR
NVIM_CONFIG=$NVIM_CONFIG_DIR/init.vim
ln -s -f $DIR/init.vim $NVIM_CONFIG

if [ ! -d $NVIM_CONFIG_DIR/plugged ]; then
	mkdir -p $NVIM_CONFIG_DIR/{autoload,plugged}
	curl -sfLo $NVIM_CONFIG_DIR/autoload/plug.vim \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip install --user neovim

	cat << EOF > $DIR/post-install.sh
#!/usr/bin/env bash
nvim --headless -c PlugInstall -c qa
rm \${BASH_SOURCE[0]}
EOF
	chmod u+x $DIR/post-install.sh
fi

NVIM_DESKTOP_FILE=/tmp/nvim.desktop
cp $DIR/nvim.desktop $NVIM_DESKTOP_FILE
NVIM_DESKTOP_WRAPPER=$DIR/nvim-desktop-wrapper.sh
cat << EOF >> $NVIM_DESKTOP_FILE
Exec=$NVIM_DESKTOP_WRAPPER %F
EOF

xdg-icon-resource install --novendor --size 48 $DIR/nvim-48.png nvim
xdg-icon-resource install --novendor --size 128 $DIR/nvim-128.png nvim

xdg-desktop-menu install --novendor /tmp/nvim.desktop
mimeo --add 'glob:text/*' nvim.desktop
mimeo --prefer 'glob:text/*' nvim.desktop
rm /tmp/nvim.desktop
