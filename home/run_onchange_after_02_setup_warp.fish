#!/bin/fish
printf "\n======== [Cloudflare WARP] ========\n"

set WARP_SYSTEMD (systemctl status warp-svc.service)
if string match -q -r "Active: active \(running\)" $WARP_SYSTEMD
  echo "✅ systemd service started"
else
  echo "🚀 Starting systemd service..."
  sudo systemctl start warp-svc.service
end

if string match -q -r "Loaded: loaded.*?; enabled" $WARP_SYSTEMD
  echo "✅ systemd service enabled"
else
  echo "🚀 Enabling systemd service"
  sudo systemctl enable warp-svc.service
end

warp-cli registration show >/dev/null 2>/dev/null
if test $status -eq 0
  echo "✅ Already registered"
else
  echo "⚒️ Registering..."
  warp-cli registration new
end

set WARP_SETTINGS (warp-cli settings)
if string match --quiet --regex 'Mode: WarpWithDnsOverHttps' $WARP_SETTINGS
    echo "✅ Current mode is already 'WarpWithDnsOverHttps'."
else
    echo "⚒️ Changing mode to WARP over HTTPS (for faster DNS change)..."
    warp-cli mode warp+doh
end
