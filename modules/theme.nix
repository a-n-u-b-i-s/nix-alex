{
  inputs,
  lib,
  config,
  ...
}:
with lib; let
  inherit (config) theme;
in {
  imports = [
    inputs.tokyonight.homeManagerModules.default
  ];
  options = {
    theme = mkOption {
      type = types.enum ["tokyonight"];
      description = "Which theme to use.";
    };
  };
  config = mkMerge [
    (mkIf (theme == "tokyonight") {
      home.sessionVariables.COLORSCHEME = "tokyonight";
      # enable globally for all supported programs
      tokyonight = {
        enable = true;
        style = "night";
      };
    })
  ];
}
