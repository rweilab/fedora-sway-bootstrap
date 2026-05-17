# no bluelight/gamma yet (sunsetr)

# syncthing
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# tailscale
sudo systemctl enable --now tailscaled
