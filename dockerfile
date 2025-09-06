# Start with the original image
FROM ghcr.io/silelmot/docker-freelancer-gameserver:latest

ENV SERVER_NAME="FL Server"
ENV SERVER_DESCRIPTION="Test FL Server."
ENV SERVER_PASSWORD="testpw"
ENV ALLOW_NEW_PLAYERS=1
ENV ENABLE_INTERNET=1
ENV PLAYER_CAN_FIGHT=0
ENV MAX_PLAYERS=30

# Skripte kopieren und Berechtigungen setzen
COPY start.sh /opt/freelancer/start.sh
COPY server_config.sh /opt/freelancer/server_config.sh
RUN chmod +x /opt/freelancer/start.sh \
    && chmod +x /opt/freelancer/server_config.sh

# Ioncross kopieren
COPY Ioncross /opt/freelancer/Ioncross
COPY windows_files /root/.wine/drive_c/windows/system32

RUN touch /opt/freelancer/Freelancer.iso

EXPOSE 2302/udp 6080
