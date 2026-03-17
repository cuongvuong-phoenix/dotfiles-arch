#!/bin/fish

printf "\n======== [dms] ========\n"
set DMS_PLUGINS (dms plugins list)

function install_plugin_if_not_exist -a id -a name
  if string match -q -r "ID: $id" $DMS_PLUGINS
    echo "✅ '$name' plugin installed"
  else
    echo "📦 Installing '$name' plugin..."
    dms plugins install $id
  end
end

install_plugin_if_not_exist dankPomodoroTimer "Dank Pomodoro Timer"
install_plugin_if_not_exist emojiLauncher "Emoji & Unicode Launcher"
install_plugin_if_not_exist calculator "Calculator"

# After
printf "\n🧹 Removing unnecessary emojis from 'Emoji & Unicode Launcher' plugin..."
rsync -av ~/.local/share/chezmoi/dms-emojiLauncher-data/ ~/.config/DankMaterialShell/plugins/emojiLauncher
~/.config/DankMaterialShell/plugins/emojiLauncher/scripts/generate_catalog.py
echo '✅ Done! Restarting DMS...'
dms restart
