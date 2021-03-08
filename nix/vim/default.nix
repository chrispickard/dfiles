{ config, pkgs, ... }:

{
  home.sessionVariables = {
    MANPAGER = "nvim -c 'set ft=man' -";
  };
  programs.neovim = {
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
    ];
    extraConfig = ''
    set clipboard=unnamedplus
    set termguicolors
    colorscheme nord
    let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
    set noshowmode
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
