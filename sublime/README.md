# Setup

## Packages

- [Terminus](https://github.com/randy3k/Terminus): packages to open/close a console panel
> You can customize terminus console panel theme by its command: `Terminus Utilities: Select Theme`, and I found `3024 night` is a good one. After selecting a them, you need to restart `sublime` to take affect.

- [Edit Command Palette](https://github.com/twolfson/sublime-edit-command-palette): to manage sublime commands

## List packages

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
		"auto-save",
		"Anaconda",
		"GoGuru",
		"GotoWindow",
		"GitGutter",
		"Edit Command Palette",
		"Material Monokai",
		"Material Theme",
		"Package Control",
		"PackageResourceViewer",
		"SaltStack-related syntax highlighting and snippets",
		"Solarized Color Scheme",
		"Six",
		"SublimeLinter",
		"SublimeREPL",
		"sublack",
		"Terminus",
		"Terrafmt",
		"Terraform",
	]
}
```

## Configure sidebar for installed theme

Just put a named theme file such as  `Material-Theme.sublime-theme` under `~/Library/Application Support/Sublime Text/Packages/User` with input:

```json
[
    {
        "class": "sidebar_label",
        "font.bold": true,
        "font.size": 20
    },
]
```

## Configure installed packages

## Anaconda

```json
{
    "pep8_ignore":
    [
        "E309"
    ],
    // Maximum line length for pep8
    "pep8_max_line_length": 88
}
```
