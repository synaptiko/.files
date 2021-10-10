#!/usr/bin/env -S deno run
const stdin = new TextDecoder().decode(await Deno.readAll(Deno.stdin));
const tree = JSON.parse(stdin);
const outputName = Deno.args[0];

for (const node of tree.nodes) {
	if (node.type === 'output' && node.name === outputName) {
		console.log(node.current_workspace);
	}
}
