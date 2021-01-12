#!/usr/bin/env sh
mod=Mod1
if [[ "$1" == "top" ]]; then
	swaymsg focus output DP-1
	swaymsg focus output DP-2
	output=²
else
	swaymsg focus output eDP-1
	output=¹
fi

swaymsg bindsym $mod+1 workspace 1$output
swaymsg bindsym $mod+2 workspace 2$output
swaymsg bindsym $mod+3 workspace 3$output
swaymsg bindsym $mod+4 workspace 4$output
swaymsg bindsym $mod+5 workspace 5$output
swaymsg bindsym $mod+6 workspace 6$output
swaymsg bindsym $mod+7 workspace 7$output
swaymsg bindsym $mod+8 workspace 8$output
swaymsg bindsym $mod+9 workspace 9$output
swaymsg bindsym $mod+0 workspace 10$output
swaymsg bindsym $mod+slash workspace /$output
swaymsg bindsym $mod+backslash workspace /$output

swaymsg bindsym $mod+Shift+1 \"move container to workspace 1$output, workspace 1$output\"
swaymsg bindsym $mod+Shift+2 \"move container to workspace 2$output, workspace 2$output\"
swaymsg bindsym $mod+Shift+3 \"move container to workspace 3$output, workspace 3$output\"
swaymsg bindsym $mod+Shift+4 \"move container to workspace 4$output, workspace 4$output\"
swaymsg bindsym $mod+Shift+5 \"move container to workspace 5$output, workspace 5$output\"
swaymsg bindsym $mod+Shift+6 \"move container to workspace 6$output, workspace 6$output\"
swaymsg bindsym $mod+Shift+7 \"move container to workspace 7$output, workspace 7$output\"
swaymsg bindsym $mod+Shift+8 \"move container to workspace 8$output, workspace 8$output\"
swaymsg bindsym $mod+Shift+9 \"move container to workspace 9$output, workspace 9$output\"
swaymsg bindsym $mod+Shift+0 \"move container to workspace 10$output, workspace 10$output\"
swaymsg bindsym $mod+Shift+slash \"move container to workspace /$output, workspace /$output\"
swaymsg bindsym $mod+Shift+backslash \"move container to workspace /$output, workspace /$output\"
