{ config, pkgs, ... }:

{
  home.packages = [ pkgs.neovim-remote pkgs.tree-sitter pkgs.page pkgs.lua pkgs.gnvim];

  home.sessionVariables = { MANPAGER = "nvim -c MANPAGER -"; MANWIDTH="999"; };
  programs.neovim = {
    # package = pkgs.neovim-nightly;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nord-vim
      vim-surround
      targets-vim
      vim-go
      kommentary
      lightline-vim
      vim-nix
      vim-markdown
      vim-manpager
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      friendly-snippets
      nvim-lspconfig
      telescope-nvim
      telescope-frecency-nvim
      telescope-fzy-native-nvim
      packer-nvim
      plenary-nvim
      neogit
      diffview-nvim
      nvim-web-devicons
      committia
      zig-vim
      pears-nvim
      (pkgs.vimPlugins.nvim-treesitter.withPlugins
        (plugins: pkgs.tree-sitter.allGrammars))
    ];
    extraConfig = ''
      set clipboard=unnamedplus
      set termguicolors
      set completeopt=menuone,noselect
      set signcolumn=yes
      set ignorecase smartcase
      let mapleader=" "
      let maplocalleader=","
      lua <<EOF
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
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

              -- Or you can define your own textobjects like this
              ["iF"] = {
                python = "(function_definition) @function",
                cpp = "(function_definition) @function",
                c = "(function_definition) @function",
                java = "(method_declaration) @function",
              },
            },
          },
        },
      }

      local lspconfig = require('lspconfig')

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      local servers = { 'rnix', 'zls' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          -- on_attach = my_custom_on_attach,
          capabilities = capabilities,
        }
      end

      
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").load()
      local cmp = require("cmp")

      cmp.setup({

        mapping = {

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<CR>'] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              end
              cmp.confirm()
            else
              fallback()
            end
          end, {"i","s","c",}),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = 'nvim_lsp' },
        },
      })

      local neogit = require("neogit")
      neogit.setup { 
        disable_insert_on_commit = false,
        disable_commit_confirmation = true,
        integrations = { diffview = true }
      }

      local telescope = require('telescope')
      local themes = require('telescope.themes')
      telescope.load_extension('fzy_native')
      telescope.load_extension("frecency")
      local actions = require("telescope.actions")

      telescope.setup {
        defaults = themes.get_ivy {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
        },
      }
      require("pears").setup()
      vim.g.kommentary_create_default_mappings = false
      vim.g.man_hardwrap = false

      vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default", {})
      vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
      vim.api.nvim_set_keymap("n", "<leader>;;", "<Plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("n", "<leader>;", "<Plug>kommentary_motion_default", {})
      vim.api.nvim_set_keymap("x", "<leader>;", "<Plug>kommentary_visual_default", {})

      vim.api.nvim_set_keymap("i", "<M-BS>", "<C-w>", {})
      vim.api.nvim_set_keymap("i", "<M-C-H>", "<C-o>dB", {})

      EOF
      let g:vim_markdown_folding_disabled = 1
      set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
      colorscheme nord
      let g:lightline = {
        \ 'colorscheme': 'nord',
        \ }
      set noshowmode
      :tnoremap <leader>[ <C-\><C-n>
      autocmd TermOpen * startinsert

      nnoremap <leader>sc :nohl<CR>
      vmap s S
      nnoremap <C-e> $
      nnoremap <C-a> ^

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>/ <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      nnoremap <M-;> <cmd>Telescope frecency<cr>
      au BufEnter github.com_*.txt set filetype=markdown
      au BufEnter gitlab.tangramflex.tech_*.txt set filetype=markdown

      let g:committia_hooks = {}
      function! g:committia_hooks.edit_open(info)
        setlocal spell
        startinsert

        imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
        imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
        map <buffer><LocalLeader><LocalLeader> :wq<cr>
        map <buffer><LocalLeader>k :q!<cr>
      endfunction
    '';

  };
  home.file.".ideavimrc".source = ./ideavimrc;

  # home.file."bin/et" = {
  #   text = ''
  #     #!/bin/sh
  #     nvim "$@"
  #   '';
  #   executable = true;
  # };

  # home.file.".vimrc".source = ./vimrc;
  # xdg.configFile."nvim/init.vim".source = ./vimrc;
  #   home.file."bin/pageme" = {
  #     text = ''
  #       #!/bin/sh
  #       nvim -n \
  #  -R \
  # -c 'set foldmethod=syntax' \
  # -c 'nmap q :q<CR>' \
  # -c 'map o <Nop>' \
  # -c 'map O <Nop>' \
  # -c 'map i <Nop>' \
  # -c 'map I <Nop>' \
  # -c 'map a <Nop>' \
  # -c 'map A <Nop>' \
  # -c 'map s <Nop>' \
  # --cmd 'map S <Nop>' \
  # --cmd 'map c <Nop>' \
  # --cmd 'map C <Nop>' \
  # -c 'set clipboard=unnamedplus' $@
  #     '';
  #     executable = true;
  #   };
}
