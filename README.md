# .dotfiles

Repository to keep track of my .dotfiles

# Macbook Pro dotfiles and setup

## Preparations

### Git (XCode)

Install it on the command line first, it will ask for permission.

```
xcode-select --install
```

### installation

```
git clone https://github.com/nikolajjsj/.dotfiles.git
cd .dotfiles
sh install.sh
sh brew.sh
sh macos.sh
```

### VSCode config

```json
{
  "terminal.integrated.shell.osx": "/usr/local/bin/fish",
  "telemetry.enableTelemetry": false,
  "telemetry.enableCrashReporter": false,
  "editor.minimap.enabled": false,
  "editor.suggestSelection": "first",
  "workbench.startupEditor": "newUntitledFile",
  "git.enableSmartCommit": true,
  "debug.openDebug": "openOnDebugBreak",
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  },
  "dart.allowAnalytics": false,
  "dart.previewLsp": true,

  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.tabSize": 2
  },
  "[vue]": {
    "editor.defaultFormatter": "octref.vetur",
    "editor.tabSize": 2
  },
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  "eslint.validate": ["javascript", "javascriptreact", "vue"],

  "vetur.useWorkspaceDependencies": true,
  "vetur.format.defaultFormatter.scss": "prettier",
  "vetur.format.defaultFormatter.css": "prettier",
  "vetur.format.defaultFormatter.js": "prettier",

  "prettier.semi": false,
  "prettier.singleQuote": true,
  "prettier.printWidth": 80,
  "vetur.format.defaultFormatterOptions": {
    "prettier": {
      "printWidth": 80,
      "singleQuote": true,
      "semi": false,
      "wrapAttributes": false
    }
  }
}
```
