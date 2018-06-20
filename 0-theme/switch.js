#!/usr/bin/env node
const yaml = require('js-yaml')
const fs = require('fs')
const colorSchemeFile = 'gruvbox-color-scheme.yaml'
const alacrittySchemeFile = 'alacritty-gruvbox-scheme.yaml'
const alacrittyConfigFile = '/home/eggze/.files/alacritty/alacritty.yml' // FIXME jprokop: use $HOME!!!!!!!
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
const alacrittyScheme = loadYaml(alacrittySchemeFile)
const newAlacrittyColors = alacrittyScheme[theme].colors
const alacrittyConfig = loadYaml(alacrittyConfigFile)

Object.keys(newAlacrittyColors).forEach(section => {
	Object.keys(newAlacrittyColors[section]).forEach(color => {
		const schemeColorName = newAlacrittyColors[section][color]
		newAlacrittyColors[section][color] = colorScheme[schemeColorName].replace(/^#/g, '0x')
	})
})

alacrittyConfig.colors = newAlacrittyColors

const newAlacrittyConfig = yaml.safeDump(alacrittyConfig, {
	lineWidth: Number.MAX_VALUE,
	noRefs: true,
	noCompatMode: true
})

fs.writeFileSync(alacrittyConfigFile, newAlacrittyConfig, { encoding: 'utf8' })

// TODO jprokop: what has to be done?
// - contact nvim and switch background from dark to light (do it over socket & nvr)
//   - create `*.vim` file for initial "theme"; it will live under `0-theme folder`
// - add comment to the beginning of generated files so I do not forgot to edit them directly
// - contact zsh (somehow) and switch pure prompt colors (branch name etc)
// - contact i3/sway and change colors there (+ in bar; but first get rid of polybar)
