Items that need to be added

Harpoon

add lazyvim toggle: 
1. go into the init file and find the window keymaps
2. lazyvim has a toggle here: https://github.com/LazyVim/LazyVim/blob/a1c3ec4cd43fe61e3b614237a46ac92771191c81/lua/lazyvim/util/toggle.lua
3. you need to essentially write a utility function called maximize
4. then create a keymap that calls the function: `LazyVim.toggle.map("<leader>wm", LazyVim.toggle.maximize)`



open new windows in a vertical split instead of a horizontal split


i want new lines to automatically create parenthese and brackets

