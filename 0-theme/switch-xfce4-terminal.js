#!/usr/bin/env node
const yaml = require('js-yaml')
const ini = require('ini')
const fs = require('fs')
const path = require('path')
const colorSchemeFile = path.join(__dirname, 'gruvbox/colors.yml')
const xfce4TerminalSchemeFile = path.join(__dirname, 'gruvbox/xfce4-terminal.yml')
const sourceConfigFile = path.join(__dirname, 'configs/source-xfce4-terminal-terminalrc')
const destinationConfigFile = path.join(__dirname, 'configs/xfce4-terminal-terminalrc')
const theme = process.argv[2] || 'dark'

function loadYaml(yamlFile) {
	try {
		return yaml.safeLoad(fs.readFileSync(yamlFile, { encoding: 'utf8' }))
	} catch (e) {
		console.error(`Error while loading ${yamlFile}`)
		throw e
	}
}

function loadIni(iniFile) {
	try {
		return ini.parse(fs.readFileSync(iniFile, { encoding: 'utf8' }).replace(/;/g, '\\;').replace(/#/g, '\\#'))
	} catch (e) {
		console.error(`Error while loading ${iniFile}`)
		throw e
	}
}

function hexToDec(hex) {
	return parseInt(hex, 16).toString(10)
}

const colorScheme = loadYaml(colorSchemeFile).colors
const xfce4TerminalScheme = loadYaml(xfce4TerminalSchemeFile)
const newXfce4TerminalColors = xfce4TerminalScheme[theme]
const xfce4TerminalConfig = loadIni(sourceConfigFile)

Object.keys(newXfce4TerminalColors).forEach(key => {
	if (key === 'ColorPalette') {
		const colors = newXfce4TerminalColors[key].map((schemeColorName) => {
			return colorScheme[schemeColorName].replace(/#(.{2})(.{2})(.{2})/, (match, r, g, b) => {
				return `rgb(${hexToDec(r)},${hexToDec(g)},${hexToDec(b)})`
			})
		})
		xfce4TerminalConfig.Configuration[key] = colors.join(';')
	}
	else {
		const schemeColorName = newXfce4TerminalColors[key]
		xfce4TerminalConfig.Configuration[key] = colorScheme[schemeColorName].replace(/#(.{2})(.{2})(.{2})/, '#$1$1$2$2$3$3')
	}
})

const newXfce4TerminalConfig = ini.stringify(xfce4TerminalConfig)

fs.writeFileSync(destinationConfigFile, newXfce4TerminalConfig.replace(/\\;/g, ';').replace(/\\#/g, '#'), { encoding: 'utf8' })
