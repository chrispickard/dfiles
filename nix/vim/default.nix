{ config, pkgs, ... }:

{
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
    ];
    extraConfig = ''
    set clipboard=unnamedplus
    set termguicolors
    colorscheme nord
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
