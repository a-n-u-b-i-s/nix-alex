{pkgs, ...}: {
  home.sessionVariables = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    HOMEBREW_NO_ANALYTICS = "1";
    CARGO_NET_GIT_FETCH_WITH_CLI = "true";
    NEXT_TELEMETRY_DISABLED = "1";
    EDITOR = "nvim";
  };

  programs = {
    fish = {
      enable = true;

      plugins = [
        {
          name = "foreign-env";
          inherit (pkgs.fishPlugins.foreign-env) src;
        }
      ];

      shellAliases = {
        ":q" = "exit";
        ":Q" = "exit";
        ":e" = "nvim";
        ":vsp" = "wezterm cli split-pane --right";
        ":sp" = "wezterm cli split-pane --bottom";
        copy = "pbcopy";
        paste = "pbpaste";
        cat = "bat";
        cfgnix = "sudo nvim /etc/nixos/configuration.nix";
        restart-gui = "sudo systemctl restart display-manager.service";
        ls = "eza";
        la = "eza -lAh";
        lg = "lazygit";
      };

      shellInit =
        # fish
        ''
          set -g fish_prompt_pwd_dir_length 20

          # Source nix files, required to set fish as default shell, otherwise
          # it doesn't have the nix env vars
          if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]
              fenv source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
          end
        '';

      interactiveShellInit =
        # fish
        ''
          fish_vi_key_bindings
        '';

      functions = {
        fish_greeting = "";

        clone = {
          description = "Clone a git repository, then cd into it.";
          body =
            # fish
            ''
              echo "cd ~/git/"
              cd $HOME/git
              git clone $argv && cd $(basename $argv .git)
            '';
        };

        sudo = {
          description = "Rerun Last Command with Sudo using `sudo !!`";
          body =
            # fish
            ''
              if test "$argv" = !!
                  eval command sudo $history[1]
              else
                  command sudo $argv
              end
            '';
        };

        cd = {
          description = "LS on CD";
          body =
            # fish
            ''
              if [ "$argv" = "" ]
                  builtin cd $HOME
              else
                  builtin cd $argv
              end
              eza -lah
            '';
        };

        nix-apply = {
          description = "Apply latest Nix configuration; checks if you need to do a git pull first";
          body =
            # fish
            ''
              argparse --name nix-apply o/offline -- $argv
              or return 1

              pushd ~/.config/nix
              if not set _flag_offline
                  echo "syncing with remote..."
                  git fetch >/dev/null && echo "" || return 1
                  set -l gitstatus $(git log HEAD..origin/$(git branch --show-current))
                  if "$gitstatus" != ""
                      echo "Run `git pull` in ~/.config/nix first"
                      return 1
                  end
              end
              popd

              darwin-rebuild switch --flake ~/.config/nix#walle
            '';
        };

        nix-clean = {
          description = "Run Nix garbage collection and remove old kernels to free up space in boot partition";
          body =
            # fish
            ''
              nix-env --delete-generations old
              nix-store --gc
              nix-channel --update
              nix-env -u --always
              nix-collect-garbage -d
            '';
        };
      };
    };
  };
}
