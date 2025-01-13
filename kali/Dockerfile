# Usa l'immagine ufficiale di Kali Linux
FROM kalilinux/kali-rolling

# Aggiorna il sistema e installa pacchetti base
RUN apt update && apt upgrade -y && \
    apt install -y \
        xfce4 \
        xfce4-goodies \
        tightvncserver \
        wget \
        websockify \
        kali-tools-information-gathering \
        kali-tools-vulnerability \
        shellinabox && \ 
    wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz && \
    tar -xvzf v1.4.0.tar.gz && \
    mv noVNC-1.4.0 /opt/noVNC && \
    rm v1.4.0.tar.gz

RUN apt update && apt install -y dbus-x11

# Configura VNC e ambiente desktop
RUN mkdir -p ~/.vnc && \
    echo '#!/bin/bash\nxrdb $HOME/.Xresources\nstartxfce4 &' > ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup

# Imposta la password di default per VNC (modifica "mypassword" con la tua password)
RUN echo "Password\nPassword\nn" | vncpasswd

# Configura Shellinabox
RUN mkdir -p /etc/shellinabox && \
    echo 'SHELLINABOX_ARGS="--disable-ssl --no-beep -s /:root:root:/root:/bin/bash"' > /etc/default/shellinabox

# Espone le porte per VNC (5901), noVNC (6080) e Shellinabox (4200)
EXPOSE 5901
EXPOSE 6080
EXPOSE 4200

# Copia lo script di avvio e rende lo script eseguibile
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
COPY start-shellinabox.sh /usr/local/bin/start-shellinabox.sh
RUN chmod +x /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-shellinabox.sh

# Comando di avvio
CMD ["bash", "-c", "start-shellinabox.sh && start-vnc.sh"]
