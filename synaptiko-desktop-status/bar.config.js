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
	case 'jprokop-tp13':
	case 'jprokop-yoga':
	default:
		blocks = [
			'system-update',
			'time-track'
		]
		break;
}

module.exports = {
	blockConfigs,
	blocks
}
