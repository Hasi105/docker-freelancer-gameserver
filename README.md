# Freelancer Game Server Docker Setup

This repository provides a Docker-based setup to run a Freelancer game server. It includes configuration options and instructions on how to set up the network using macvlan to ensure proper connectivity.

## Features

- Automated Setup: Easily deploy a Freelancer game server using Docker.
- Customizable Configuration: Adjust server settings via environment variables.
- VNC Access: Manage the server using a graphical interface through noVNC.
- Persistent Data: Game data is stored persistently using Docker volumes.

## Prerequisites

- Docker Engine: Version 19.03 or higher.
- Docker Compose: Version 1.25.0 or higher.
- Freelancer ISO: A legal copy of the Freelancer.iso installation file.
Or
- Extracted and or altered `Freelancer` folder of the ISO-file 

## Installation
### Build on your own (now there is a package,too, see dockerfile for more details)

1. **Clone the Repository:**

       git clone https://github.com/Hasi105/docker-freelancer-gameserver.git

       cd docker-freelancer-gameserver

3. **Place the Freelancer ISO:**

   Ensure you have a legal copy of Freelancer.iso and place it in the root directory of the cloned repository or add the url for download in the compose file.

3. **Build the Docker Image:**

       docker build . -t freelancer-ded

## Configuration

The server can be customized using environment variables defined in the docker-compose.yml file. Below is a list of configurable variables:
### Environment Variables

- SERVER_NAME: (Default: MyFreelancerServer)
   - The name displayed for your server in the game browser.

- SERVER_DESCRIPTION: (Default: A Server for Freelancer)
   - A brief description of your server.

- SERVER_PASSWORD: (Default: "")
   - Password required to join the server. Leave empty for no password.

- ALLOW_NEW_PLAYERS: (Default: 1)
   - Allow new players to join. Set to 1 for yes, 0 for no.

- INTERNET_ACCESS: (Default: 1)
   - Enable internet access for the server. Set to 1 for yes, 0 for no.

- PVP_ENABLED: (Default: 1)
   - Enable player versus player combat. Set to 1 for yes, 0 for no.

- MAX_PLAYERS: (Default: 16)
   - Maximum number of players allowed on the server. Range: 1 to 128.

- ISO_URL: (Default: "")
   - URL to download Freelancer.iso if not provided locally.


### Usage

  1. **Start the Server:**
	  With the ISO:

          docker run -d \
            --name freelancer-server \
            -e SERVER_NAME="FL Server" \
            -e SERVER_DESCRIPTION="Test FL Server." \
            -e SERVER_PASSWORD="testpw" \
            -e ALLOW_NEW_PLAYERS="1" \
            -e ENABLE_INTERNET="1" \
            -e PLAYER_CAN_FIGHT="0" \
            -e MAX_PLAYERS="30" \
            -e ISO_URL="" \
            -p 2302:2302/udp \
            -p 6080:6080 \
            -v ./freelancer-data:/data \
            -v ./FLStats:/root/.wine/drive_c/FLStats \
            -v ./Ioncross:/opt/freelancer/Ioncross \
            -v ./Freelancer.iso:/opt/freelancer/Freelancer.iso \
            freelancer-ded
          
          
          Or with the folder:

          docker run -d \
            --name freelancer-server \
            -e SERVER_NAME="FL Server" \
            -e SERVER_DESCRIPTION="Test FL Server." \
            -e SERVER_PASSWORD="testpw" \
            -e ALLOW_NEW_PLAYERS="1" \
            -e ENABLE_INTERNET="1" \
            -e PLAYER_CAN_FIGHT="0" \
            -e MAX_PLAYERS="30" \
            -e ISO_URL="" \
            -p 2302:2302/udp \
            -p 6080:6080 \
            -v ./freelancer-data:/data \
            -v ./FLStats:/root/.wine/drive_c/FLStats \
            -v ./Ioncross:/opt/freelancer/Ioncross \
            -v ./Freelancer/:/opt/freelancer/Freelancer/ \
            freelancer-ded

  2. **Access noVNC Interface:**

     Open your web browser and navigate to http://<container_ip>:6080 to access the graphical interface.

  3. **Connect to the Server:**
     - Launch Freelancer on your client machine.
     - Search for your server using the SERVER_NAME you configured.
     - Join and enjoy the game!

# Troubleshooting

- Server Not Visible:
   - Check firewall settings to ensure necessary ports are open (2302 for Freelancer, 6080 for noVNC).

- Cannot Access noVNC Interface:
    -  Verify that port 6080 is mapped correctly.
    -  Ensure that your browser supports HTML5 and that noVNC dependencies are properly installed.

- ISO File Issues:
    - Confirm that Freelancer.iso is present in the root directory or that ISO_URL is correctly specified.
    - Check for download errors or file corruption.

# License

This project is licensed under the MIT License. See the LICENSE file for details.


*Please ensure you have a legal copy of the Freelancer game. Do not distribute copyrighted materials without proper authorization.# docker-freelancer-gamerserver
a game server for vanilla freelancer on docker, using wine*
