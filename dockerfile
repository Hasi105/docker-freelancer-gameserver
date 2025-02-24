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
    p7zip-full \
    cabextract \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

# VNC-Setup: Passwortloser Zugang
RUN mkdir -p ~/.vnc && echo "x11vnc" > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# Winetricks: DirectPlay, riched30 und vcrun6sp6 installieren
RUN winetricks -q directplay riched30 vcrun6sp6

# Workspace festlegen
WORKDIR /opt/freelancer

# Start-Skript kopieren
COPY start.sh /opt/freelancer/start.sh
RUN chmod +x /opt/freelancer/start.sh

# Konfigurationsskript hinzufügen
COPY server_config.sh /opt/freelancer/server_config.sh
RUN chmod +x /opt/freelancer/server_config.sh

# Port für den VNC-Webservice
EXPOSE 6080

# Container starten
CMD ["/opt/freelancer/start.sh"]
