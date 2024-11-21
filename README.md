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

## Installation

1. **Clone the Repository:**

       git clone https://github.com/yourusername/freelancer-docker-server.git

       cd freelancer-docker-server

3. **Place the Freelancer ISO:**

   Ensure you have a legal copy of Freelancer.iso and place it in the root directory of the cloned repository or add the url for download in the compose file.

3. **Build the Docker Image:**

       docker-compose build

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

**Example docker-compose.yml snippet:**

       environment:
         - SERVER_NAME=MyCustomFreelancerServer
         - SERVER_DESCRIPTION=Welcome to my custom server!
         - SERVER_PASSWORD=secretpassword
         - ALLOW_NEW_PLAYERS=1
         - INTERNET_ACCESS=1
         - PVP_ENABLED=1
         - MAX_PLAYERS=32
         - ISO_URL=https://example.com/Freelancer.iso

## Network Setup with Macvlan

To ensure that the Freelancer server is accessible on your local network and can receive broadcast packets, it's necessary to use the macvlan network driver. This allows the container to appear as a physical device on your network.
### Why Macvlan?

Broadcast Support: The Freelancer server relies on broadcast packets for discovery and communication, which standard Docker networking does not support.
Network Isolation: Macvlan provides better isolation and performance by assigning a unique MAC address to the container.

#### Setting Up Macvlan

  1. **Create a Macvlan Network:**

     Replace eth0 with your host network interface.

         docker network create -d macvlan \
           --subnet=192.168.1.0/24 \
           --gateway=192.168.1.1 \
           -o parent=eth0 \
           freelancer_macvlan

  2. **Modify docker-compose.yml:**
    
     Use the created macvlan network in your docker-compose.yml.

         networks:
           default:
             external:
               name: freelancer_macvlan

   3. **Update Network Settings:**
     
      Ensure the IP range and gateway match your network configuration.

**Note:** Macvlan networks may not be able to communicate with the host network directly. You might need to configure additional routing if required.

### Usage

  1. **Start the Server:**

          docker-compose up -d

  2. **Access noVNC Interface:**

     Open your web browser and navigate to http://<container_ip>:6080 to access the graphical interface.

  4. **Connect to the Server:**
     - Launch Freelancer on your client machine.
     - Search for your server using the SERVER_NAME you configured.
     - Join and enjoy the game!

# Troubleshooting

- Server Not Visible:
   - Ensure that the macvlan network is correctly configured.
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
