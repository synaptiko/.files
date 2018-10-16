const os = require('os')
const blockConfigs = {
	// FIXME jprokop: temporary solution
	'time-track': {
		extend: 'command',
		prefix: 'T ',
		command: 'sudo -u jprokop node /home/jprokop/Documents/todo/time-track.js'
	}
}
let blocks

switch (os.hostname()) {
	case 'jprokop':
		Object.assign(blockConfigs, {
			volume0: {
				extend: 'volume',
				sinkIndex: 0,
				volumeIndexFormat: 'sinkIndex'
			},
			volume1: {
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
	default:
		Object.assign(blockConfigs, {
			volume0: {
				extend: 'volume',
				sinkIndex: 0,
				volumeIndexFormat: 'activePort'
			}
		})
		blocks = [
			'system-update',
			'volume0',
			'time-track',
			'date-time'
		]
		break;
}

module.exports = {
	blockConfigs,
	blocks
}
