# Misc. Linux commands
- `sudo ldconfig` to update links for shared libaraies (e.g. after manually installing a library from source).

# Games on Linux
## Proton issues
- Nothing happens on launch
  - Make sure the SteamLibrary directory is on an ext4 formatted partition, not NTFS
  
# GTK
- To find icons: `flatpak install flathub org.gnome.design.IconLibrary`

# Troubleshooting
Things that have helped me fix issues in the past.
## Fedora
### No audio on first boot
https://superuser.com/questions/1688412/no-sound-in-fedora-35-even-though-everything-looks-good

`systemctl --user enable --now wireplumber`

## Ubuntu
### Cursed apt update
Some things that have randomly gone wrong on startup, apparently after a bad update.

#### Missing nvidia graphics support, low screen resolution, etc.
- Check Logs (dmesg or Logs in GUI) for "NVRM: API mismatch"
  - Try booting an older kernel from grub. (`Advanced options for...`)
  - Run full apt update/upgrade.
  - Purge nvidia drivers `sudo apt purge nvidia*`
  - Restart with the new kernel.
  - Reinstall drivers based on recommends from `ubuntu-drivers list` or equivalent.

#### Missing ethernet
- Check for name of ethernet device with `lspci`.
  - Try removing the relevant kernel modules, and re-adding as mentioned in https://askubuntu.com/a/1242028.
  - May need to shutdown and turn back on (from a cold start, not reboot) to see results:  https://bugs.launchpad.net/ubuntu/+source/linux-signed/+bug/1876593.
