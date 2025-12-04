#!/bin/fish

printf "\n======== [Set correct XDG mime applications] ========\n"

function set_mime_types_to_app -a app
  set -l mime_types (grep "MimeType=" "/usr/share/applications/$app" | sed 's/MimeType=//' | tr ';' '\n')

  xdg-mime default $app $mime_types
  printf "✅ Successfully set following mime types:\n$(string join '\n' $mime_types)\nto '$app'\n\n"
end

# Images
set_mime_types_to_app qimgv.desktop

# PDF
set_mime_types_to_app okularApplication_pdf.desktop
