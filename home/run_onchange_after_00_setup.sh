#!/bin/fish

printf "\n==== [yazi] ====\n"
printf "\nInstalling plugins...\n"
ya pkg install

printf "\n==== [tmux] ====\n"
printf "\nInstalling plugins...\n"
~/.tmux/plugins/tpm/bin/install_plugins

printf "\n==== [fish] ====\n"
printf "\nApplying Dracula theme...\n"
fish_config theme save Dracula
printf "\nInstalling & updating plugins with fisher...\n"
fisher update

printf "\n==== [mise] ====\n"
printf "\nInstalling runtimes\n"
mise install

printf "\n==== [rust] ====\n"
printf "\nInstalling nightly toolchain...\n"
rustup toolchain install nightly
rustup default nightly

