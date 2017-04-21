#/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

XFCE4_TERMINAL_CONFIG=~/.config/xfce4/terminal/terminalrc

# Colors overtaken from Gruvbox scheme: https://github.com/morhetz/gruvbox
if [[ "$1" == "light" ]]; then
	# ColorBackground=rgb(249,245,215)	#f9f5d7, light0_hard
	# ColorForeground=rgb(60,56,54)			#3c3836, dark1
	# ColorBold=rgb(40,40,40)						#282828, dark0
	# ColorCursor=rgb(146,131,116)			#928374, gray_245
	# TabActivityColor=rgb(204,36,29)		#cc241d, neutral_red
	# palette=[
	# 	rgb(253,244,193);	#fbf1c7, 0, light0
	# 	rgb(204,36,29);		#cc241d, 1, neutral_red
	# 	rgb(152,151,26);	#98971a, 2, neutral_green
	# 	rgb(215,153,33);	#d79921, 3, neutral_yellow
	# 	rgb(69,133,136);	#458588, 4, neutral_blue
	# 	rgb(177,98,134);	#b16286, 5, neutral_purple
	# 	rgb(104,157,106);	#689d6a, 6, neutral_aqua
	# 	rgb(124,111,100);	#7c6f64, 7, dark4
	# 	rgb(146,131,116);	#928374, 8, gray_245
	# 	rgb(157,0,6);			#9d0006, 9, faded_red
	# 	rgb(121,116,14);	#79740e, 10, faded_green
	# 	rgb(181,118,20);	#b57614, 11, faded_yellow
	# 	rgb(7,102,120);		#076678, 12, faded_blue
	# 	rgb(143,63,113);	#8f3f71, 13, faded_purple
	# 	rgb(66,123,88);		#427b58, 14, faded_aqua
	# 	rgb(60,56,54)			#3c3836, 15, dark1
	# ]
	THEME_FILE=$DIR/terminalrc-light
else
	# ColorBackground=rgb(29,32,33)			#1d2021, dark0_hard
	# ColorForeground=rgb(235,219,178)	#ebdbb2, light1
	# ColorBold=rgb(253,244,193)				#fbf1c7, light0
	# ColorCursor=rgb(146,131,116)			#928374, gray_245
	# TabActivityColor=rgb(204,36,29)		#cc241d, neutral_red
	# ColorPalette=
	# 	rgb(40,40,40);		#282828, 0, dark0
	# 	rgb(204,36,29);		#cc241d, 1, neutral_red
	# 	rgb(152,151,26);	#98971a, 2, neutral_green
	# 	rgb(215,153,33);	#d79921, 3, neutral_yellow
	# 	rgb(69,133,136);	#458588, 4, neutral_blue
	# 	rgb(177,98,134);	#b16286, 5, neutral_purple
	# 	rgb(104,157,106);	#689d6a, 6, neutral_aqua
	# 	rgb(168,153,132);	#a89984, 7, light4
	# 	rgb(146,131,116);	#928374, 8, gray_245
	# 	rgb(251,73,52);		#fb4934, 9, bright_red
	# 	rgb(184,187,38);	#b8bb26, 10, bright_green
	# 	rgb(250,189,47);	#fabd2f, 11, bright_yellow
	# 	rgb(131,165,152);	#83a598, 12, bright_blue
	# 	rgb(211,134,155);	#d3869b, 13, bright_purple
	# 	rgb(142,192,124);	#8ec07c, 14, bright_aqua
	# 	rgb(235,219,178)	#ebdbb2, 15, light1
	# ]
	THEME_FILE=$DIR/terminalrc-dark
fi

# do a little bit of magic so xfce4-terminal always load a fresh configuration!
rm $XFCE4_TERMINAL_CONFIG
cp $THEME_FILE $XFCE4_TERMINAL_CONFIG
ln -s -f $THEME_FILE $XFCE4_TERMINAL_CONFIG
