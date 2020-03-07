#!/usr/bin/env node
const yaml = require('js-yaml')
const fs = require('fs')
const path = require('path')
const colorSchemeFile = path.join(__dirname, 'gruvbox/colors.yml')
const wofiSchemeFile = path.join(__dirname, 'gruvbox/wofi.yml')
const destinationConfigFile = path.join(__dirname, 'configs/wofi-colors')
const theme = process.argv[2] || 'dark'

function loadYaml(yamlFile) {
	try {
		return yaml.safeLoad(fs.readFileSync(yamlFile, { encoding: 'utf8' }))
	} catch (e) {
		console.error(`Error while loading ${yamlFile}`)
		throw e
	}
}

const colorScheme = loadYaml(colorSchemeFile).colors
const wofiScheme = loadYaml(wofiSchemeFile)

const newWofiColors = [
	colorScheme[wofiScheme[theme]['color']],
	colorScheme[wofiScheme[theme]['background-color']],
	''
]

fs.writeFileSync(destinationConfigFile, newWofiColors.join('\n'), { encoding: 'utf8' })
