#!/bin/bash

ISO_URL=${ISO_URL:-""}


# Pfad zum Freelancer-Verzeichnis
FREELANCER_DIR="/opt/freelancer/Freelancer"

# Pfad zur ISO-Datei
ISO_PATH="/opt/freelancer/Freelancer.iso"

# Sicherstellen, dass /data existiert
mkdir -p /data
# Erforderliche übergeordnete Verzeichnisse erstellen

mkdir -p "/root/.wine/drive_c/users/root/My Documents/My Games/Freelancer/Accts"

# Originalverzeichnis entfernen und Symlink erstellen
rm -rf "/root/.wine/drive_c/users/root/My Documents/My Games/Freelancer/Accts/MultiPlayer"
ln -s /data "/root/.wine/drive_c/users/root/My Documents/My Games/Freelancer/Accts/MultiPlayer"

cd /opt/freelancer


# Prüfen, ob die Freelancer-Serverdateien bereits vorhanden sind
#if [ ! -d "/opt/freelancer/Freelancer" ]; then
#    echo "Freelancer-Serverdateien nicht gefunden. Starte Installation aus ISO..."#
#
    # Freelancer-ISO herunterladen (falls nicht vorhanden)
#    if [ ! -f "/opt/freelancer/Freelancer.iso" ]; then
#        echo "Lade Freelancer.iso herunter..."
#        wget -O /opt/freelancer/Freelancer.iso https://archive.org/download/freelancer_20230310/Freelancer.iso
#    fi



# Prüfen, ob die Freelancer-Serverdateien bereits vorhanden sind
if [ ! -d "$FREELANCER_DIR" ]; then
    echo "Freelancer-Serverdateien nicht gefunden. Starte Installation aus ISO..."

    # Prüfen, ob eine lokale ISO-Datei eingebunden wurde
    if [ -f "$ISO_PATH" ]; then
        echo "Lokale Freelancer.iso-Datei wird verwendet."
    elif [ -n "$ISO_URL" ]; then
        echo "Lade Freelancer.iso von URL: $ISO_URL"
        wget -O "$ISO_PATH" "$ISO_URL"
    else
        echo "Fehler: Keine ISO-Datei gefunden und ISO_URL ist nicht gesetzt."
        echo "Bitte binde eine lokale ISO-Datei ein oder setze die Umgebungsvariable ISO_URL."
        exit 1
    fi

    # CAB1.CAB direkt aus der ISO extrahieren
    echo "Extrahiere CAB1.CAB aus Freelancer.iso..."
    mkdir -p /opt/freelancer/temp_cab

    # Verwende 7z, um CAB1.CAB direkt aus der ISO zu extrahieren
    7z e /opt/freelancer/Freelancer.iso CAB1.CAB -o/opt/freelancer/temp_cab


    # CAB-Datei entpacken
    echo "Entpacke Inhalte von CAB1.CAB..."
    cd /opt/freelancer/temp_cab
    cabextract CAB1.CAB


    echo "Kopiere Freelancer-Dateien..."

    mkdir -p /opt/freelancer/Freelancer
    cp -r Cab1/data /opt/freelancer/Freelancer/DATA
    cp -r Cab1/dlls /opt/freelancer/Freelancer/DLLS
    cp -r Cab1/exe /opt/freelancer/Freelancer/EXE


    # Berechtigungen setzen
    chmod -R +x /opt/freelancer/Freelancer/EXE


    # Temporäre Dateien entfernen
    cd /opt/freelancer
    rm -rf /opt/freelancer/temp_cab

    echo "Installation abgeschlossen."
else
    echo "Freelancer-Serverdateien bereits vorhanden. Überspringe Installation."
fi

# Display und VNC einrichten
export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1024x768x16 &
fluxbox &
x11vnc -display $DISPLAY -bg -forever -nopw -quiet -rfbport 5909 &

# noVNC starten und auf allen Schnittstellen verfügbar machen
websockify --web=/usr/share/novnc/ --wrap-mode=ignore 0.0.0.0:6080 localhost:5909 &
echo "noVNC gestartet: Zugriff unter http://localhost:6080"

# Konfigurationsskript ausführen
cd /opt/freelancer/
./server_config.sh

#mkdir -p  $FL_SERVER_CFG
# Freelancer starten
cd /opt/freelancer/Freelancer/EXE/
wine ./FLServer.exe /c 
#ln -s $FL_SERVER_CFG /data
#tail -f /dev/null

