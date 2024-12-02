{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # services.sketchybar.enable = true;
  # services.sketchybar.package = pkgs.sketchybar;

  # nix.package = pkgs.nix;

  # Enable touch ID support for sudo.
  security.pam.enableSudoTouchIdAuth = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  homebrew.enable = true;
  homebrew.casks = [
    "raycast"
    # "whatsapp"
    # "bitwarden"
    # "obs"
    # "ableton-live-suite"
    # "splice"
    # "ilok-license-manager"
    # "daisydisk"
  ];

  users.users.alexhudym = {
    name = "alexhudym";
    home = "/Users/alexhudym";
  };
}
