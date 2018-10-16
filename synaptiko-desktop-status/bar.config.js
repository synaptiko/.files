const os = require('os')
let blockConfigs, blocks

switch (os.hostname()) {
	case 'jprokop':
		blockConfigs = {
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
		}
		blocks = [
			'system-update',
			'volume0',
			'volume1',
			'date-time'
		]
		break;
	case 'jprokop-tp13':
	default:
		blockConfigs = {
			volume0: {
				extend: 'volume',
				sinkIndex: 0,
				volumeIndexFormat: 'activePort'
			}
		}
		blocks = [
			'system-update',
			'volume0',
			'date-time'
		]
		break;
}

module.exports = {
	blockConfigs,
	blocks
}
