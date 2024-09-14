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
if vim.fn.has 'wsl' == 1 then
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
end

-- 折叠行时，视觉上与起始行保持相同缩进
option.breakindent = true

-- Save undo history
option.undofile = true

-- 查找时开启智能大小写匹配
option.smartcase = true

-- 最左侧的两列，可以用来打断点，或者其他用途
option.signcolumn = 'yes'

-- 可以理解为事件响应时间
option.updatetime = 250

-- 序列超时时间，超时展示which-key
option.timeoutlen = 300

-- 分割窗口时，新窗口在哪个方向，右和下
option.splitright = true
option.splitbelow = true

-- 打开空白图表显示
option.list = true
-- tab显示为>>加一个空格，多余空格展示为·，不间断空格为␣
option.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 使用替换命令时，实时预览替换结果
option.inccommand = 'split'

-- 光标所在行高亮
option.cursorline = true

-- 光标不距离上下边缘10行
option.scrolloff = 10
