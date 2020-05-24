# Setup

## Packages

- [Terminus](https://github.com/randy3k/Terminus): packages to open/close a console panel

- [Edit Command Palette](https://github.com/twolfson/sublime-edit-command-palette): to manage sublime commands

## Listes packages

> Preferences -> Package Settings -> Package Control -> Settings-User

```json
{
	"bootstrapped": true,
	"in_process_packages":
	[
	],
	"installed_packages":
	[
		"A File Icon",
		"Edit Command Palette",
		"Material Monokai",
		"Material Theme",
		"Package Control",
		"PackageResourceViewer",
		"SaltStack-related syntax highlighting and snippets",
		"Solarized Color Scheme",
		"SublimeREPL",
		"Terminus"
	]
}
```

## Configure sidebar for installed theme

Just put a named theme file such as  `Material-Theme.sublime-theme` under `~/Library/Application Support/Sublime Text 3/Packages/User` with input:

```json
[
    {
        "class": "sidebar_label",
        "font.bold": true,
        "font.size": 20
    },
]
```
