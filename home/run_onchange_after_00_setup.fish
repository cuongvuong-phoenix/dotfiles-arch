#!/bin/fish

printf "\n======== [dms] ========\n"
printf "\n🚀 Installing plugins...\n"
dms plugins install dankPomodoroTimer
dms plugins install emojiLauncher

printf "\n======== [yazi] ========\n"
printf "\n🚀 Installing plugins...\n"
ya pkg install

printf "\n======== [tmux] ========\n"
printf "\n🚀 Installing plugins...\n"
~/.tmux/plugins/tpm/bin/install_plugins

printf "\n======== [fish] ========\n"
printf "\n🚀 Applying Dracula theme...\n"
fish_config theme save Dracula
printf "\n🚀 Installing & updating plugins with fisher...\n"
fisher update

printf "\n======== [mise] ========\n"
printf "\n🚀 Installing runtimes\n"
mise install

