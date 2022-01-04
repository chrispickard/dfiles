{ config, pkgs, ... }:

{
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/mjlbach/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  # ];
  home.packages = [ pkgs.neovim-remote pkgs.tree-sitter pkgs.page pkgs.lua ];

  home.sessionVariables = { MANPAGER = "nvim -c MANPAGER -"; };
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
      vim-commentary
      lightline-vim
      vim-nix
      vim-markdown
      vim-manpager
      nvim-cmp
      cmp-nvim-lsp
      nvim-lspconfig
      telescope-nvim
      packer-nvim
      plenary-nvim
      neogit
      diffview-nvim
      nvim-web-devicons
      (pkgs.vimPlugins.nvim-treesitter.withPlugins
        (plugins: pkgs.tree-sitter.allGrammars))
    ];
    extraConfig = ''
      set clipboard=unnamedplus
      set termguicolors
      set completeopt=menuone,noselect
      lua <<EOF
      require('packer').startup(function()
        use {
            'glacambre/firenvim',
            run = function() vim.fn['firenvim#install'](0) end
        }
      end)
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

      local servers = { 'rnix' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          -- on_attach = my_custom_on_attach,
          capabilities = capabilities,
        }
      end

      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
        },
      }

      local neogit = require("neogit")
      neogit.setup { 
        disable_insert_on_commit = false,
        disable_commit_confirmation = true,
        integrations = { diffview = true }
      }
      neogit.config.use_magit_keybindings()
      EOF
      let g:vim_markdown_folding_disabled = 1
      set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
      colorscheme nord
      let g:lightline = {
        \ 'colorscheme': 'nord',
        \ }
      set noshowmode
      let mapleader=" "
      :tnoremap <leader>[ <C-\><C-n>
      autocmd TermOpen * startinsert

      nnoremap <leader>sc :nohl<CR>
      vmap s S
      nnoremap <C-e> $
      nnoremap <C-a> ^

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      au BufEnter github.com_*.txt set filetype=markdown
      au BufEnter gitlab.tangramflex.tech_*.txt set filetype=markdown
    '';

  };
  home.file.".ideavimrc".source = ./ideavimrc;

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
