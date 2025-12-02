#!/bin/fish

printf "\n======== [yazi] ========\n"
echo "🚀 Installing plugins..."
ya pkg install

printf "\n======== [tmux] ========\n"
echo "🚀 Installing plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

printf "\n======== [fish] ========\n"
echo "🚀 Applying Dracula theme..."
fish_config theme save Dracula
echo "🚀 Installing & updating plugins with fisher..."
fisher update

printf "\n======== [mise] ========\n"
echo "🚀 Installing runtimes"
mise install

