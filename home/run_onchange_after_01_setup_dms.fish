#!/bin/fish

printf "\n======== [dms] ========\n"
set DMS_PLUGINS (dms plugins list)

if string match -q -r "ID: dankPomodoroTimer" $DMS_PLUGINS
  echo "✅ 'Dank Pomodoro Timer' plugin installed"
else
  echo "📦 Installing 'Dank Pomodoro Timer' plugin..."
  dms plugins install dankPomodoroTimer
end

if string match -q -r "ID: emojiLauncher" $DMS_PLUGINS
  echo "✅ 'Emoji & Unicode Launcher' plugin installed"
else
  echo "📦 Installing 'Emoji & Unicode Launcher' plugin..."
  dms plugins install emojiLauncher
end
