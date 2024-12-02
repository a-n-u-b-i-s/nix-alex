{inputs, ...}: {
  programs = {
    lazygit.enable = true;
    ripgrep.enable = true;
    neovim = {
      defaultEditor = true;
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config;
  };
}
