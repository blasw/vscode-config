local vim = vim

-- use plug instead of packer and assign to variable Plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/vimfiles/plugged')

Plug('phaazon/hop.nvim')

vim.call('plug#end')

-- setup hop
local hop = require'hop'
hop.setup { keys = "etovxqpdygfblzhckisuran" }

-- assign hop word highlight to the letter f in all vim modes
vim.keymap.set('', 'f', function()
  hop.hint_words()
end, { remap=true })

-- log all installed lua packages including hop to see available functions
print(vim.inspect(package.loaded))

-- open vim config
vim.cmd('nmap <leader>c :e c://users/ochob/appdata/local/nvim/init.lua<cr>')

-- motion 
vim.keymap.set({'n', 'v'}, 'j', 'h')
vim.keymap.set({'n', 'v'}, 'k', 'j')
vim.keymap.set({'n', 'v'}, 'l', 'k')
vim.keymap.set({'n', 'v'}, ';', 'l')

-- Operator-pending mappings
vim.keymap.set({'o', 'v'}, 'j', 'h')
vim.keymap.set({'o', 'v'}, 'k', 'j')
vim.keymap.set({'o', 'v'}, 'l', 'k')
vim.keymap.set({'o', 'v'}, ';', 'l')

--tabs
vim.cmd('nmap <tab> gt')
vim.cmd('nmap <s-tab> gT')  

--default binds
--erase current line and enter insert mode
-- vim.keymap.set("n", "<S-s>", "0C", { noremap = true })
vim.keymap.set("n", "<S-s>", function()
  local line = vim.fn.getline(".")  -- Get the current line
  local indent = line:match("^%s*") -- Extract the indentation
  vim.fn.setline(".", indent)       -- Set the line to the indentation
  vim.api.nvim_feedkeys("A", "n", true)  -- Enter insert mode at the end of the line
end, { noremap = true, silent = true })


--move to the start of the line
vim.keymap.set({ "n", "v" }, "<S-j>", "^", { noremap = true })

--move to the end of the line
vim.keymap.set({ "n", "v" }, ":", "$", { noremap = true })

--select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })

--jump 3 lines up
vim.cmd('nmap <S-l> 3lzz')
vim.cmd('vmap <S-l> 3lzz')

--jump 3 lines down
vim.cmd('nmap <S-k> 3kzz')
vim.cmd('vmap <S-k> 3kzz')

vim.opt.clipboard = 'unnamedplus'

-- полезное
-- shift + k - открыть документацию; shift + k (ещё раз) - перенести фокус на документацию
-- gd - перейти к определению ( если уже в определении - найти все ссылки)