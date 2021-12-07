-- d8b   db d888888b db   dD  .d88b.  db       .d8b.     d88b    d88b .d8888.    d88b 
-- 888o  88   `88'   88 ,8P' .8P  Y8. 88      d8' `8b    `8P'    `8P' 88'  YP    `8P' 
-- 88V8o 88    88    88,8P   88    88 88      88ooo88     88      88  `8bo.       88  
-- 88 V8o88    88    88`8b   88    88 88      88~~~88     88      88    `Y8b.     88  
-- 88  V888   .88.   88 `88. `8b  d8' 88booo. 88   88 db. 88  db. 88  db   8D db. 88  
-- VP   V8P Y888888P YP   YD  `Y88P'  Y88888P YP   YP Y8888P  Y8888P  `8888Y' Y8888P  
--
-- Author:  Nikolaj Jensen
-- repo  :  https://github.com/nikolajjsj/.dotfiles/

-- Sourcing plugins, remaps and settings
require'settings'
require'mappings'
require'plugins'

-- Lua plugins configurations
require'plugins.lsp'
require'plugins.treesitter'
require'plugins.statusbar'
require'plugins.telescopes'

