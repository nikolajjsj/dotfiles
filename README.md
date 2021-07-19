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
  "editor.tabSize": 2,
  "workbench.startupEditor": "newUntitledFile",
  "git.enableSmartCommit": true,
  "editor.fontFamily": "'FiraCode Nerd Font' , Menlo, Monaco, 'Courier New', monospace",
  "editor.cursorSmoothCaretAnimation": true,
  "workbench.iconTheme": "material-icon-theme",
  "editor.linkedEditing": true,
  "dart.flutterSdkPath": "/opt/homebrew/Caskroom/flutter/2.2.2/flutter",
  "terminal.integrated.defaultProfile.osx": "zsh",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always",

  "search.exclude": {
    "**/node_modules": true,
    "**/*.code-search": true,
    "ios/": true,
    "android/": true,
    "dist/": true,
    "yarn.lock": true,
    "package-lock.json": true,
    ".gitignore": true,
    ".expo": true,
    ".vscode": true
  },

  "[dart]": {
    "editor.formatOnSave": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false,
    "editor.tabSize": 2
  },
  "dart.previewLsp": false,
  "dart.allowAnalytics": false,

  "[javascript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[vue]": { "editor.defaultFormatter": "octref.vetur" },
  "[css]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[json]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[jsonc]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[javascriptreact]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[html]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[typescript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[typescriptreact]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
  "[svelte]": { "editor.defaultFormatter": "svelte.svelte-vscode" },

  "eslint.validate": ["javascript", "javascriptreact", "vue"],

  "vetur.useWorkspaceDependencies": true,
  "vetur.format.defaultFormatter.scss": "prettier",
  "vetur.format.defaultFormatter.css": "prettier",
  "vetur.format.defaultFormatter.js": "prettier",

  "prettier.semi": true,
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
