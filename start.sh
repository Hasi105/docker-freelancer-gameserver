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

    if [ ! -f "/opt/freelancer/temp_cab/CAB1.CAB" ]; then
        echo "Fehler: CAB1.CAB konnte nicht extrahiert werden."
        exit 1
    fi

    # CAB-Datei entpacken
    echo "Entpacke Inhalte von CAB1.CAB..."
    cd /opt/freelancer/temp_cab
    cabextract CAB1.CAB

    echo "Kopiere Freelancer-Dateien..."
    mkdir -p "$FREELANCER_DIR"
    cp -r Cab1/data "$FREELANCER_DIR/DATA"
    cp -r Cab1/dlls "$FREELANCER_DIR/DLLS"
    cp -r Cab1/exe "$FREELANCER_DIR/EXE"

    # Berechtigungen setzen
    chmod -R +x "$FREELANCER_DIR/EXE"

    # Temporäre Dateien entfernen
    cd /opt/freelancer
    rm -rf /opt/freelancer/temp_cab

    echo "Installation abgeschlossen."
else
    echo "Freelancer-Serverdateien bereits vorhanden. Überspringe Installation."
fi

# Konfigurationsskript ausführen
cd /opt/freelancer
./server_config.sh

# Display-/VNC-Umgebung starten
export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1024x768x16 &
fluxbox &
x11vnc -display $DISPLAY -bg -forever -nopw -quiet -rfbport 5909 &
websockify --web=/usr/share/novnc/ --wrap-mode=ignore 0.0.0.0:6080 localhost:5909 &
echo "noVNC gestartet: Zugriff unter http://localhost:6080"
ln -sf /usr/share/novnc/vnc_lite.html /usr/share/novnc/index.html

sleep 2
xsetroot -solid grey &

# Freelancer-Server starten
cd "$FREELANCER_DIR/EXE"
wine ./FLServer.exe /c &
