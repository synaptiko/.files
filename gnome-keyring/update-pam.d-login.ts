#!/usr/bin/env -S deno run --allow-read=/etc/pam.d/login --allow-write=/etc/pam.d/login
const filePath = "/etc/pam.d/login";
const content = await Deno.readTextFile(filePath);
const lines = content.split('\n');
const authPart = "auth       optional     pam_gnome_keyring.so";
const sessionPart = "session    optional     pam_gnome_keyring.so auto_start";
const addAuthPart = !lines.includes(authPart);
const addSessionPart = !lines.includes(sessionPart);

if (addAuthPart || addSessionPart) {
	for (let i = 0; i < lines.length; i += 1) {
		const currentLine = lines[i];
		const nextLine = lines[i + 1] ?? '';

		if (addAuthPart && currentLine.startsWith('auth ') && !nextLine.startsWith('auth ')) {
			i += 1;
			lines.splice(i, 0, authPart);
		} else if (addSessionPart && currentLine.startsWith('session ') && !nextLine.startsWith('session ')) {
			i += 1;
			lines.splice(i, 0, sessionPart);
		}
	}

	await Deno.writeTextFile(filePath, lines.join('\n'));
}
