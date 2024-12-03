# Setup Steps

Home Folder = /Users/{username} = ~

1. Create a Folder in your Computer at this location: ~/.config/nix

cd ~

mkdir -p .config

cd .config

git clone https://github.com/anubis/nix-alex

mv nix-alex nix

open nix

2. Edit the following files:

2.1. flake.nix
2.2. system.nix
2.3. user.nix
2.4. modules/fish.nix

In all of these files, replace alexhudym with your username.

3. Install Nix

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

This is ask you to press y & enter your password.

4. Run Install Command for nix configuration

nix run nix-darwin -- switch --flake ~/.config/nix#{username}

This command will ask for your password multiple times.
You might need to run this multiple times. After each of the steps below.
It might fail, if it does, call me.

If it says some file will be overwritten and that is why it fails, you will need to do the following:

4.1. Backup the File

sudo mv {filepath} {filepath}.before-nix-darwin

filepath will be in the error message.

4.2. Run the command again with extra flags

nix run {flags} nix-darwin -- switch --flake ~/.config/nix#{username}

When you run the command again after backing up the file, it will fail, and ask you to add some flags to the command to get it to work. It will show you one of these errors at a time. Add the first flag, and then the error for the second missing flag will show up.

Ask ChatGPT to format the command you need based on the error message.

5. Setup your active shell

sudo echo "/run/current-system/sw/bin/fish" >> /etc/shells

chsh -s /run/current-system/sw/bin/fish

6. Open & Setup Wezterm

It should open up in a borderless window.
And it should look identical Alex's Setup

7. Also Open up Aerospace App
