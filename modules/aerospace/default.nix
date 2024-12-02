{...}: {
  xdg.configFile."aerospace" = {
    recursive = true;
    source = ./config;
  };
}
