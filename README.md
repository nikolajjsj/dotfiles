# .dotfiles

Repository to keep track of my .dotfiles

# MacOS dotfiles and setup

## Preparations

### Commandline utilities & HomeBrew

Install it on the command line first, it will ask for permission.

```bash
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## installation

```
cd && mkdir dev
cd dev
git clone https://github.com/nikolajjsj/.dotfiles.git
cd .dotfiles
sh install.sh
```

Optionally you could run each script seperately:
```
sh macos.sh
sh brew.sh
```

## VSCode config

```json
{
    "telemetry.enableTelemetry": false,
    "telemetry.enableCrashReporter": false,
    "editor.minimap.enabled": false,
    "editor.suggestSelection": "first",
    "workbench.startupEditor": "none",
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
