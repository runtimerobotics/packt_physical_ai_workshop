# packt_physical_ai_workshop
A practical workshop on Physical AI with ROS 2—building intelligent robotic systems through perception, planning, control, and real-world deployment.

## Docker Setup on Ubuntu

Use the setup script to install Docker on Ubuntu 22.04 or Ubuntu 24.04:

```bash
wget https://raw.githubusercontent.com/runtimerobotics/packt_physical_ai_workshop/main/setup_docker_ubuntu.sh
chmod +x setup_docker_ubuntu.sh
./setup_docker_ubuntu.sh
```

After the script finishes, log out and log back in, reboot, or run:

```bash
newgrp docker
```

This refreshes your user group membership so Docker can run without `sudo`.
