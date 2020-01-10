# Force v-sync to stop screen-tearing with nVidia graphics drivers.
# Based on , supports multiple monitors.

With a single monitor, it is possible to fix screen-tearing by running the 
following script on startup:
```
#!/bin/bash

nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"

```

Based on https://unix.stackexchange.com/a/550695 and 
https://unix.stackexchange.com/a/550695 it should be possible to do for 
multiple monitors, from the command-line, but I haven't been able to find the 
correct input to `nvidia-settings -a` to work for my setup. 

Here's what to do instead:
- Run `sudo nvidia-xorg`.
- Run `nvidia-settings`.
  - In the `X Server Display Configuration`, for each display, click
    `Advanced...` and check `Force Composition Pipeline`.
  - Press `Apply` and check it looks okay.
  - Click `Save to X Configuration File` and choose `/etc/X11/xorg.conf`.
- Log out and log back in.
- To confirm the fix is applied, run `nvidia-settings -q CurrentMetaMode -t` 
  and check for `ForceCompositionPipeline=On` for each display.
