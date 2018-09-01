{
  "Vendor": true,
  "Deadline": "2m",
  "Sort": ["linter", "severity", "path", "line"],
  "Exclude": [
      "vendor/",
      "func (\\S*) should be (\\S*['.]*)",
      "exported \\w+ (\\S*['.]*)([a-zA-Z'.*]*) should have comment or be unexported"
  ],
  "EnableGC": true,
  "Linters": {
      "nakedret": {
        "Command": "nakedret",
        "Pattern": "^(?P<path>.*?\\.go):(?P<line>\\d+)\\s*(?P<message>.*)$"
      }
  },
  "WarnUnmatchedDirective": true,

  "DisableAll": true,
  "Enable": [
    "deadcode",
    "gocyclo",
    "gofmt",
    "goimports",
    "golint",
    "gosimple",
    "ineffassign",
    "interfacer",
    "lll",
    "misspell",
    "nakedret",
    "unconvert",
    "unparam",
    "unused",
    "vet"
  ],

  "Cyclo": 16,
  "LineLength": 200
}
