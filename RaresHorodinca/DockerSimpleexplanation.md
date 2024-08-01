# Docker Overview

## Docker Image

A Docker image is a lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, environment variables, and configuration files.

### Characteristics:
- **Immutable**: Once created, it cannot be changed.
- **Layers**: Images are built in layers. Each layer represents a change or addition to the previous layer (e.g., adding a file, installing a package).
- **Repository**: Stored in repositories like DockerHub.

## Docker Container

A Docker container is a runtime instance of a Docker image. It is what actually runs the application.

### Characteristics:
- **Isolated**: Containers are isolated from each other and the host system. They have their own filesystem, network interface, and process space.
- **Ephemeral**: Containers can be started, stopped, moved, or deleted. They can be replaced by new containers from the same image.
- **Stateful**: Containers can maintain state, but typically data is managed separately using volumes or bind mounts.

## Docker Commands

### `docker run`

The `docker run` command creates and starts a container from a specified image. It is the primary command for running containers.


**Options include**:
- `-d`: Run container in detached mode (in the background).
- `-p`: Publish a container's port(s) to the host.
- `-v`: Bind mount a volume.
- `--name`: Assign a name to the container.

### `docker build`

The `docker build` command builds a Docker image from a Dockerfile. A Dockerfile is a text file that contains instructions on how to build the image.


**Options include**:
- `-t`: Name and optionally a tag in the 'name:tag' format.
- `-f`: Name of the Dockerfile (Default is 'PATH/Dockerfile').

## CHROOT Analogy of a Dockerfile

### Docker Image vs. chroot Environment

- **Docker Image**: Think of a Docker image as a tarball (archive file) that contains a complete filesystem with all necessary binaries, libraries, and configurations for your application. It's a snapshot of a particular state of your application and its dependencies.
- **chroot Environment**: A chroot environment is a directory that contains a filesystem tree. When you chroot into this directory, it becomes the new root ("/") for the process. It's like a minimal, isolated operating system environment within the host.

### Docker Container vs. chrooted Process

- **Docker Container**: A running instance of a Docker image. It uses Linux kernel features like namespaces and cgroups to provide isolation from other containers and the host system. Containers can be easily started, stopped, and managed.
- **chrooted Process**: A process running in a chroot environment is isolated from the rest of the filesystem hierarchy. However, chroot alone does not provide as strong isolation as Docker containers because it doesn't include additional namespace isolation for network, processes, etc.

