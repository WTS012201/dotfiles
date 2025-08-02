vim.g.mapleader = " "

function getFileName()
  local filename = vim.fn.expand("%:t:r")
  return filename
end

function insertTsxPattern()
  local fileName = getFileName()
  local pattern = {
    "interface " .. fileName .. "Props{}",                                            -- Line 1
    "",                                                                               -- Empty line
    "export const " .. fileName .. ": React.FC<" .. fileName .. "Props> = ({}) => {", -- Line 3
    "  return <div></div>",                                                           -- Line 4
    "}",                                                                              -- Line 5
  }

  -- Insert the pattern into the current buffer
  vim.api.nvim_put(pattern, "l", true, true)

  -- Save and format the document by simulating <C-s> keybinding
  vim.cmd(":w")
  vim.cmd(":e")
end

local function go_to_definition_in_split()
  local win_count = vim.fn.winnr("$")
  local win_position = vim.fn.winnr()

  local has_vertical_split = win_count > 1

  if not has_vertical_split then
    vim.cmd("vsplit")
  end

  -- Save current buffer and cursor before moving
  local current_buf = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)

  -- Move to the other split
  if win_position == 1 then
    vim.cmd("wincmd l")
  else
    vim.cmd("wincmd h")
  end

  -- Set the correct buffer and cursor in the target window
  vim.api.nvim_win_set_buf(0, current_buf)
  vim.api.nvim_win_set_cursor(0, cursor)

  -- Now call LSP definition (will resolve properly)
  vim.lsp.buf.definition()
end

vim.keymap.set("n", "<leader>h", go_to_definition_in_split, { noremap = true, silent = true })

vim.api.nvim_create_user_command("FNR", function(opts)
  local dir = opts.args:match("^(%S+)")

  local target_word, replacement_word = opts.args:match('^%S+ "(.-[^\\])" "(.-[^\\])"$')

  if not target_word or not replacement_word then
    print('Invalid arguments! Usage: FNR <dir> "<target>" "<replacement>"')
    return
  end

  target_word = target_word:gsub("/", "\\/")
  replacement_word = replacement_word:gsub("/", "\\/")

  local cmd = string.format("find %s -type f -exec sed -i 's/%s/%s/g' {} \\;", dir, target_word, replacement_word)

  vim.cmd("!" .. cmd)
end, { nargs = "*" })

vim.keymap.set("n", "<leader>h", go_to_definition_in_split, { noremap = true, silent = true })

-- Set the keybinding for the new function
vim.api.nvim_set_keymap("n", "<leader>tsx", ":lua insertTsxPattern()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- highlight move and autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor remain in place
vim.keymap.set("n", "J", "mzJ`z")

-- cursor remain in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- highlight replace without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy text into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- no cap q
vim.keymap.set("n", "Q", "<nop>")

-- change all occurences
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- save
vim.keymap.set({ "n", "i" }, "<C-s>", function()
  vim.lsp.buf.format()
  vim.cmd("write")
end)

-- tab & shift tab
vim.keymap.set({ "n", "i" }, "<s-tab>", "<cmd><<cr>")
vim.keymap.set("n", "<tab>", "<cmd>><cr>")
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- window
vim.keymap.set("n", "<M-v>", ":vsplit <cr>")
vim.keymap.set("n", "<M-q>", ":q <cr>")
vim.keymap.set("n", "<M-l>", ":wincmd l<cr>")
vim.keymap.set("n", "<M-h>", ":wincmd h<cr>")
