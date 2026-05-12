# packt_physical_ai_workshop
A practical workshop on Physical AI with ROS 2—building intelligent robotic systems through perception, planning, control, and real-world deployment.

Join the workshop discussion on [Discord](https://discord.gg/qXeYdqrkdn).


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
- If you do not have a PC with these requirements, you can use a cloud GPU provider such as [Vast.ai](https://cloud.vast.ai/?ref_id=374137/).
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

## Install VS Code on Ubuntu

Download and install the latest stable VS Code Debian package:

```bash
wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode.deb
sudo apt install ./vscode.deb
```

After VS Code is installed, open it and install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

## Use VSCode and Dev Container

After the image is pulled and the Dev Containers extension is installed, open the `packt_physical_ai_workshop` folder in VS Code. VS Code should automatically detect the dev container configuration and show a prompt to **Reopen the folder in the container**.



## Workshop Setup: Video Tutorial

### 01 - Setting Workshop Environment: Docker Dev Container

[![01 - Setting Workshop Environment: Docker Dev Container](https://img.youtube.com/vi/bo14tujjxM4/hqdefault.jpg)](https://youtu.be/bo14tujjxM4)

### 02 - Setting Cloud Environment: Vast.ai

[![02 - Setting Cloud Environment: Vast.ai](https://img.youtube.com/vi/tlPWjQjGtt8/hqdefault.jpg)](https://youtu.be/tlPWjQjGtt8)

### 03 - Testing Isaac Sim in Local and Vast.ai

[![03 - Testing Isaac Sim in Local and Vast.ai](https://img.youtube.com/vi/ehf8Q3nfNKk/hqdefault.jpg)](https://youtu.be/ehf8Q3nfNKk)


## Possible Issues with NVIDIA Isaac Sim

If you see the following texture cache errors:

```text
Failed to create texture cache in /isaac-sim/.cache/ov/texturecache
Failed to create texture cache folder /isaac-sim/.cache/ov/texturecache
```

Run:

```bash
sudo chmod -R 777 ~/docker/isaac-sim
```

## Instructor

[Lentin Joseph](https://www.linkedin.com/in/lentinjoseph/) - Connect on LinkedIn for workshop updates, robotics content, and Physical AI resources.