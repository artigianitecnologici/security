#!/bin/bash

# Avvia dbus-launch
dbus-launch --config-file=/etc/dbus-1/system.conf &

# Genera il file .Xauthority (se non esiste)
touch ~/.Xauthority

# Avvia il server VNC
vncserver :1 -geometry 1280x800 -depth 24

# Avvia noVNC per accesso tramite browser
/opt/noVNC/utils/novnc_proxy --vnc localhost:5901 --listen 6080 &

# Mantieni il container in esecuzione
tail -f /dev/null
