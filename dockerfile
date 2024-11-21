# Basis-Image
FROM ubuntu:20.04

# Setze den Frontend-Modus auf noninteractive, um interaktive Abfragen zu vermeiden
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Aktivieren der i386 Architektur und notwendige Pakete installieren
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y \
    xvfb \
    fluxbox \
    x11vnc \
    wget \
    unzip \
    wine \
    wine32 \
    winbind \
    novnc \
    websockify \
    winetricks \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

# VNC-Setup: Passwortloser Zugang
RUN mkdir -p ~/.vnc && echo "x11vnc" > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# Winetricks: DirectPlay, riched30 und vcrun6sp6 installieren
RUN winetricks -q directplay riched30 vcrun6sp6

# Workspace festlegen
WORKDIR /opt/freelancer

# Freelancer-Dateien hinzufügen
#ADD freelancer.tar /opt/freelancer/

# Start-Skript kopieren
COPY start.sh /opt/freelancer/start.sh
RUN chmod +x /opt/freelancer/start.sh

#copy freelancer.iso
#COPY Freelancer.iso /opt/freelancer/Freelancer.iso

# Konfigurationsskript hinzufügen
COPY server_config.sh /opt/freelancer/server_config.sh
RUN chmod +x /opt/freelancer/server_config.sh

#RUN mkdir /data
# Deklariere das Volume
#VOLUME ["/data"]
# Arbeitsverzeichnis setzen
#WORKDIR /opt/freelancer/Freelancer/EXE/

# Port für den VNC-Webservice
EXPOSE 6080

# Container starten
CMD ["/opt/freelancer/start.sh"]
