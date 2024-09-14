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

-- 所有模式都允许使用鼠标
option.mouse = 'a'

-- 不显示当前模式，因为status line已经显示了
option.showmode = false

-- 与系统剪切板互通
vim.schedule(function()
  option.clipboard = 'unnamedplus'
end)

-- 下方是与windows互通剪切板的配置，能用但有些小bug，不是+，*寄存器才触发
-- 配置 win32yank 剪贴板接口
local copy = function(lines, _)
  local text = table.concat(lines, '\n')
  vim.fn.system('win32yank.exe -i', text)
end

local paste = function()
  local output = vim.fn.system 'win32yank.exe -o'
  return vim.split(output, '\n', { trimempty = true })
end

-- 注册剪贴板提供器
global.clipboard = {
  name = 'win32yank',
  copy = {
    ['+'] = copy,
    ['*'] = copy,
  },
  paste = {
    ['+'] = paste,
    ['*'] = paste,
  },
}

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
