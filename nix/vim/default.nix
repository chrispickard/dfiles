{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/mjlbach/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  home.packages = [ pkgs.neovim-remote pkgs.page pkgs.lua ];
  home.sessionVariables = {
    MANPAGER = "nvim -c 'set ft=man' -";
  };
  programs.neovim = {
    package = pkgs.neovim-nightly;
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
      nvim-compe
      telescope-nvim
      nvim-lspconfig
    ];
    extraConfig = ''
    set clipboard=unnamedplus
    set termguicolors
    set completeopt=menuone,noselect
    lua <<EOF
    require'lspconfig'.gopls.setup{}
    EOF
    let g:compe = {}
    let g:compe.enabled = v:true
    let g:compe.autocomplete = v:true
    let g:compe.debug = v:false
    let g:compe.min_length = 1
    let g:compe.preselect = 'enable'
    let g:compe.throttle_time = 80
    let g:compe.source_timeout = 200
    let g:compe.incomplete_delay = 400
    let g:compe.max_abbr_width = 100
    let g:compe.max_kind_width = 100
    let g:compe.max_menu_width = 100
    let g:compe.documentation = v:true

    let g:compe.source = {}
    let g:compe.source.path = v:true
    let g:compe.source.buffer = v:true
    let g:compe.source.calc = v:true
    let g:compe.source.nvim_lsp = v:true
    let g:compe.source.nvim_lua = v:true
    let g:compe.source.vsnip = v:true
    let g:compe.source.ultisnips = v:true
    set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
    colorscheme nord
    let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
    set noshowmode
    let mapleader=" "
    :tnoremap <leader>[ <C-\><C-n>
    autocmd TermOpen * startinsert

    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    '';

  };

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
