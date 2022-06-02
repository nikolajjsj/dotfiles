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
cd && mkdir code
cd code
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
  "telemetry.telemetryLevel": "off",
  "editor.minimap.enabled": false,
  "editor.suggestSelection": "first",
  "workbench.startupEditor": "none",
  "git.enableSmartCommit": true,
  "debug.openDebug": "openOnDebugBreak",
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.bracketPairColorization.enabled": true,
  "workbench.iconTheme": "material-icon-theme",
  "editor.cursorBlinking": "smooth",
  "editor.cursorSmoothCaretAnimation": true,
  "editor.fontFamily": "'FiraCode Nerd Font', Menlo, Monaco, 'Courier New', monospace",
  "terminal.integrated.tabs.enabled": false,
  "workbench.colorTheme": "GitHub Dark Default",
  "gitlens.views.branches.branches.layout": "list",
  "gitlens.defaultGravatarsStyle": "identicon",
  "gitlens.codeLens.enabled": false,

  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
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
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue"
  ],
  "prettier.semi": true,
  "prettier.trailingComma": "all",
  "prettier.printWidth": 80,

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
  "javascript.preferences.importModuleSpecifier": "project-relative",
  "typescript.preferences.importModuleSpecifier": "project-relative"
}
```
