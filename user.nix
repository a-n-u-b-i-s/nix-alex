# home.nix
{
  pkgs,
  lib,
  config,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.age
    # pkgs.pijul
    pkgs.devenv
    pkgs.alejandra
    pkgs.nixd
    pkgs.lua-language-server
    pkgs.aerospace
    pkgs.bacon
    pkgs.bat
    # pkgs.cbonsai
    pkgs.erdtree
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgs.k9s
    pkgs.just
    pkgs.jq
    pkgs.jujutsu
    pkgs.jc
    pkgs.mkcert
    pkgs.yazi
    pkgs.procs
    pkgs.tokei
    pkgs.tldr
    pkgs.wget
    pkgs.yt-dlp
    pkgs.git-credential-manager
    pkgs.yq
    # pkgs.arc-browser
    # pkgs.spotify
    pkgs.nodejs_20
    pkgs.python313Full
    # pkgs.zoom-us
    # pkgs.hueadm
    pkgs.zls
    pkgs.wezterm
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.zoxide.enable = true;
  programs.eza.enable = true;

  imports = [
    ./modules/fish.nix
    ./modules/oh-my-posh.nix
    ./modules/nvim
    ./modules/wezterm
  ];

  programs.git = {
    enable = true;
    delta.enable = true;
  };
  programs.gh.enable = true;

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    config = {
      global = {
        hide_env_diff = true;
      };
    };
  };

  programs.awscli.enable = true;
}
