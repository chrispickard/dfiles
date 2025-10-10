{ config, pkgs, ... }:

{
  home.packages = [ pkgs.tree-sitter pkgs.page pkgs.lua ];

  home.sessionVariables = { MANPAGER = "nvim +Man!"; };
  programs.neovim = {
    # package = pkgs.stable.neovim;
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
      # vim-manpager
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
