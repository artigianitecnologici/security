# Usa l'immagine ufficiale di Kali Linux
FROM kalilinux/kali-rolling

# Aggiorna il sistema e installa pacchetti base
RUN apt update && apt upgrade -y && \
    apt install -y \
        xfce4 \
        xfce4-goodies \
        tightvncserver \
        wget \
        websockify && \
        get https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz && \
    tar -xvzf v1.4.0.tar.gz && \
    mv noVNC-1.4.0 /opt/noVNC && \
    rm v1.4.0.tar.gz
    # kali-tools-information-gathering \
    # kali-tools-vulnerability && \
RUN apt update && apt install -y dbus-x11

# Configura VNC e ambiente desktop
RUN mkdir -p ~/.vnc && \
    echo '#!/bin/bash\nxrdb $HOME/.Xresources\nstartxfce4 &' > ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup

# Imposta la password di default per VNC (modifica "mypassword" con la tua password)
# Imposta la password di default per VNC (Password)
RUN echo "Password\nPassword\nn" | vncpasswd

# Imposta la variabile USER richiesta da VNC
ENV USER=root

# Espone le porte per VNC (5901) e noVNC (6080)
EXPOSE 5901
EXPOSE 6080

# Copia lo script di avvio e rende lo script eseguibile
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Comando di avvio
CMD ["start-vnc.sh"]
