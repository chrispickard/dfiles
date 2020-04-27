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
  };

  home.file.".vimrc".source = ./vimrc;
  xdg.configFile."nvim/init.vim".source = ./vimrc;
}
