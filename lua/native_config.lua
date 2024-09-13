--[[
--一些vim原生支持的配置，分离出来层次比较清晰
--比如Options，Variable（一般是全局变量），Autocommand，Keymapping
--]]

-- 对应optionions
local option = vim.opt
-- 全局变量
local global = vim.g
-- 缓冲区变量
local buffer = vim.b

global.mapleader = ' '
global.maplocalleader = ' '

-- linux是否安装了Nerd Font字体，安装了true，没装false
global.have_nerd_font = true
-- 下面是options的配
option.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- option.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
option.mouse = 'a'

-- Don't show the mode, since it's already in the status line
option.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  option.clipboard = 'unnamedplus'
end)

-- Enable break indent
option.breakindent = true

-- Save undo history
option.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
option.ignorecase = true
option.smartcase = true

-- Keep signcolumn on by default
option.signcolumn = 'yes'

-- Decrease update time
option.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
option.timeoutlen = 300

-- Configure how new splits should be opened
option.splitright = true
option.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
option.list = true
option.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
option.inccommand = 'split'

-- Show which line your cursor is on
option.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
option.scrolloff = 10
