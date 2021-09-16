const os = require('os')
const blockConfigs = {
	// FIXME jprokop: temporary solution
	'time-track': {
		extend: 'command',
		prefix: 'T ',
		command: 'sudo -u jprokop node /home/jprokop/Documents/time-track-utils/time-track.js',
		refreshId: 'time-track',
		interval: {
			amount: 1,
			unit: 'minute'
		}
	}
}
let blocks

switch (os.hostname()) {
	case 'jprokop':
		Object.assign(blockConfigs, {
			'volume0': {
				extend: 'volume',
				sinkIndex: 0,
				volumeIndexFormat: 'sinkIndex'
			},
			'volume1': {
				extend: 'volume',
				sinkIndex: 1,
				volumeIndexFormat: 'sinkIndex',
				hideWhenNotRunning: true
			}
		})
		blocks = [
			'system-update',
			'volume0',
			'volume1',
			'time-track',
			'date-time'
		]
		break;
	case 'jprokop-tp13':
	case 'jprokop-yoga':
	default:
		const wifiName = (os.hostname() === 'jprokop-tp13' ? 'wlp3s0' : 'wlp0s20f3')
		Object.assign(blockConfigs, {
			// FIXME jprokop: temporary solution
			'i3status-relay': {
				config: `general {
					output_format = "none"
					interval = 15
				}

				order += "battery all"
				battery all {
					format = "%status %percentage (%remaining)"
					format_down = "No battery"
					status_chr = "B++"
					status_bat = "B--"
					status_unk = "B??"
					status_full = "B"
					path = "/sys/class/power_supply/BAT%d/uevent"
					hide_seconds = true
					integer_battery_capacity = true
				}`
			},
			'battery': {
				extend: 'i3status-relay',
				relayBlockIndex: 0
			}
		})
		blocks = [
			'system-update',
			'battery',
			'time-track',
			'date-time'
		]
		break;
}

module.exports = {
	blockConfigs,
	blocks
}
