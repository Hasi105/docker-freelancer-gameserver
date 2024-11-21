#!/bin/bash

# EULA als akzeptiert markieren
wine reg add "HKCU\\Software\\Microsoft\\Microsoft Games\\Freelancer\\1.0" /v FIRSTRUN /t REG_DWORD /d 1 /f

# FLServer-Einstellungen setzen
wine reg add "HKCU\\Software\\Microsoft\\flserver\\Settings" /v EULA_Accepted /t REG_DWORD /d 1 /f
wine reg add "HKCU\\Software\\Microsoft\\flserver\\Settings" /v Firstrun /t REG_DWORD /d 1 /f


# Pfad zur FLServer.cfg
FL_SERVER_CFG="/root/.wine/drive_c/users/root/My Documents/My Games/Freelancer/Accts/MultiPlayer/FLServer.cfg"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$(dirname "$FL_SERVER_CFG")"

# Umgebungsvariablen auslesen (Standardwerte für den Fall, dass nichts gesetzt wurde)
SERVER_NAME=${SERVER_NAME:-MyFreelancerServer}
SERVER_DESCRIPTION=${SERVER_DESCRIPTION:-A Server for Freelancer}
SERVER_PASSWORD=${SERVER_PASSWORD:-""}
ALLOW_NEW_PLAYERS=${ALLOW_NEW_PLAYERS:-1}
INTERNET_ACCESS=${INTERNET_ACCESS:-1}
PVP_ENABLED=${PVP_ENABLED:-1}
MAX_PLAYERS=${MAX_PLAYERS:-16}

# Servereinstellungen definieren (Testwerte)
#SERVER_NAME=$(printf 'A%.0s' {1..32})        # 32-mal 'A'
#SERVER_DESCRIPTION=$(printf 'B%.0s' {1..128}) # 128-mal 'B'
#SERVER_PASSWORD=$(printf 'C%.0s' {1..16})     # 16-mal 'C'
#MAX_PLAYERS=16                                # Maximale Spieleranzahl (dezimal, z.B. 16)

# Einstellungen definieren
#ALLOW_NEW_PLAYERS=1       # 1 für ja, 0 für nein
#ENABLE_INTERNET=1         # 1 für ja, 0 für nein
#PLAYER_CAN_FIGHT=1        # 1 für ja, 0 für nein

# Funktion zum Konvertieren eines Strings in das spezielle Format
convert_string() {
  local input="$1"
  local max_chars="$2"
  local output=""
  local length=${#input}

  # Auf maximale Länge beschränken
  if [ $length -gt $max_chars ]; then
    length=$max_chars
    input=${input:0:$length}
  fi

  # Jedes Zeichen konvertieren
  for ((i=0; i<length; i++)); do
    char="${input:$i:1}"
    # ASCII-Wert des Zeichens holen
    ascii=$(printf '%d' "'$char")
    output+=$(printf '\\x%02X\\x00' "$ascii")
  done

  # Mit Nullbytes auffüllen
  remaining=$((max_chars - length))
  for ((i=0; i<remaining; i++)); do
    output+="\x00\x00"
  done

  echo -ne "$output"
}

# Header (4 Bytes)
echo -ne "\x03\x00\x00\x00" > "$FL_SERVER_CFG"

# Servername (32 Zeichen)
convert_string "$SERVER_NAME" 32 >> "$FL_SERVER_CFG"

# 2 Nullbytes als Trennung
echo -ne "\x00\x00" >> "$FL_SERVER_CFG"

# Beschreibung (128 Zeichen)
convert_string "$SERVER_DESCRIPTION" 128 >> "$FL_SERVER_CFG"

# 2 Nullbytes als Trennung
echo -ne "\x00\x00" >> "$FL_SERVER_CFG"

# Passwort (16 Zeichen)
convert_string "$SERVER_PASSWORD" 16 >> "$FL_SERVER_CFG"

# 2 Nullbytes nach dem Passwort
echo -ne "\x00\x00" >> "$FL_SERVER_CFG"

# Einstellungen
# Einstellung 1: "Neue Spieler zulassen"
echo -ne "$(printf '\\x%02X' $ALLOW_NEW_PLAYERS)" >> "$FL_SERVER_CFG"

# Einstellung 2: "Server auf Internetzugriff umstellen"
echo -ne "$(printf '\\x%02X' $ENABLE_INTERNET)" >> "$FL_SERVER_CFG"

# Maximale Spieleranzahl (1 Byte in Hex)
MAX_PLAYERS_HEX=$(printf '%02X' "$MAX_PLAYERS")
echo -ne "\\x$MAX_PLAYERS_HEX" >> "$FL_SERVER_CFG"

# 3 Nullbytes
echo -ne "\x00\x00\x00" >> "$FL_SERVER_CFG"

# Einstellung 3: "Spieler können andere Spieler bekämpfen"
echo -ne "$(printf '\\x%02X' $PLAYER_CAN_FIGHT)" >> "$FL_SERVER_CFG"

# Restliche Nullbytes oder Abschlussdaten (falls erforderlich)
# Gesamtgröße der Datei ermitteln und ggf. auffüllen
desired_size=373
current_size=$(stat -c%s "$FL_SERVER_CFG")
padding_size=$((desired_size - current_size))

if [ $padding_size -gt 0 ]; then
  dd if=/dev/zero bs=1 count=$padding_size 2>/dev/null >> "$FL_SERVER_CFG"
fi

# Ausgabe zur Kontrolle
#echo "FLServer.cfg wurde erstellt. Vorschau:"
