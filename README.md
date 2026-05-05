# packt_physical_ai_workshop
A practical workshop on Physical AI with ROS 2—building intelligent robotic systems through perception, planning, control, and real-world deployment.

## PC Requirements for Isaac Sim

Isaac Sim requires an NVIDIA RTX GPU with RT Cores. NVIDIA GPUs without RT Cores, such as A100 and H100, are not supported for Isaac Sim.

| Setting | Processor | RAM | SSD Storage | NVIDIA Graphics Card |
| --- | --- | --- | --- | --- |
| Minimum | Intel Core i7 7th Gen / AMD Ryzen 5, 4 cores | 16 GB | 50 GB SSD | GeForce RTX 3050, 8 GB VRAM |
| Medium / Good | Intel Core i7 9th Gen / AMD Ryzen 7, 8 cores | 32 GB | 100 GB SSD | GeForce RTX 4080, 12 GB VRAM |
| Maximum / Ideal | Intel Core i9, X-series or higher / AMD Ryzen 9, Threadripper or higher, 16 cores | 64 GB or more | 1 TB NVMe SSD | RTX PRO 6000 Blackwell, 48 GB VRAM |

Notes:

- The Isaac Sim container is supported on Linux.
- More RAM and VRAM is recommended for advanced scenes, many sensors, and Isaac Lab training.
- Internet access is required for online Isaac Sim assets and some extensions.
- If you do not have a PC with these requirements, you can use a cloud GPU provider such as Vast.ai: <https://vast.ai/>.
- Source: [NVIDIA Isaac Sim 5.1 Requirements](https://docs.isaacsim.omniverse.nvidia.com/5.1.0/installation/requirements.html).

## Docker Setup on Ubuntu

Use the setup script to install Docker on Ubuntu 22.04 or Ubuntu 24.04:

```bash
wget -O setup_docker_ubuntu.sh https://raw.githubusercontent.com/runtimerobotics/packt_physical_ai_workshop/main/setup_docker_ubuntu.sh && chmod +x setup_docker_ubuntu.sh && ./setup_docker_ubuntu.sh
```

After the script finishes, log out and log back in, reboot, or run:

```bash
newgrp docker
```

This refreshes your user group membership so Docker can run without `sudo`.

Test Docker permissions with:

```bash
docker run hello-world
```

If you see a Docker socket permission error, refresh your group membership with `newgrp docker`, then run the test command again.

## Pull the Workshop Image

Pull the prebuilt workshop image:

```bash
docker pull therobocademy/packt_physical_ai_workshop:latest
```

## Note

This document is still developing.
