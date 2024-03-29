set nowrap lazyredraw ignorecase splitright splitbelow termguicolors
set wildmode=longest:full,full
set dir=~/tmp
set conceallevel=2
set path=.,,         " don't include /usr/include in path
set expandtab        " enter spaces when tab is pressed
set textwidth=80     " break lines when line length increases
set softtabstop=4
set shiftwidth=4     " number of spaces to use for auto indent
set regexpengine=2   " set the default regexp engine (mac will freeze up with default

packadd! matchit
let maplocalleader=","
tnoremap <C-w> <C-\><C-n><C-w>
nmap <leader>f :lexpr system('fd -td ')<left><left>
nmap <leader>ap :silent let &path=expand('<cfile>')..","..&path<CR>

nmap <c-c><c-c> gzap}
runtime zepl/contrib/python.vim  " Enable the Python contrib module.
runtime zepl/contrib/load_files.vim
runtime zepl/contrib/nvim_autoscroll_hack.vim
let g:repl_config = {
            \ 'python': {
                \ 'cmd': 'python',
                \ 'formatter': function('zepl#contrib#python#formatter'),
                \ 'load_file': 'import "%s"'
            \ },
            \ 'r': { 'cmd': 'R', 'load_file': 'source("%s")' },
        \ }

augroup init
    autocmd!
    autocmd FileType sql setlocal formatprg=pg_format\ -
augroup END

if executable('rg') " if ripgrep is installed
    setlocal grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    setlocal grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Lua Configuration
lua <<EOF

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pylsp'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').hls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"r", "python", "haskell"},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing (for "all")
  -- ignore_install = {},
  highlight = {
    enable = true, -- `false` will disable the whole extension
    -- disable = {"c", "rust"}, -- names of parsers
    additional_vim_regex_highlighting = false, -- can also be a list of languages
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>rn",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition_lsp_fallback = "<leader>gd",
        list_definitions_toc = "gO",
        goto_next_usage = "]k",
        goto_previous_usage = "[k",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ak"] = "@call.outer",
        ["ik"] = "@call.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "rounded",
      peek_definition_code = {
        ["<leader>p"] = "@function.outer",
        ["<leader>P"] = "@class.outer",
      },
    },
  },
}
EOF

" for checking a highlight group
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" removes trailing whitespace
function TrimWhiteSpace()
    %s/\s*$//
    ''
endfunction
command TrimWhiteSpace call TrimWhiteSpace()


colorscheme monstera
highlight TrailingWhitespace guibg=DarkMagenta
call matchadd("TrailingWhitespace", '\v\s+$')
