# Docker Commands and Lessons

## Building and Inspecting Docker Images

```bash
docker build -t cmd-echo .
```

### Explore CMD of `cmd-echo`

```bash
docker inspect cmd-echo | jq .[0].ContainerConfig.Cmd
```

### Run the Container with Default Values

```bash
docker run --rm cmd-echo
```

### Run the Container with Updated CMD Command

```bash
docker run --rm cmd-echo date
```

## Lesson 4: Dockerfile Best Practices

```bash
cat > /root/Dockerfile <<EOF
FROM alpine
ENTRYPOINT ["echo", "hi, from container!"]
EOF
```

### Example Dockerfile for Go Application

```dockerfile
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine
WORKDIR /src # cached
COPY go.mod go.sum /src/
RUN go mod download
COPY . .
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
```

### Multi-Stage Builds

With multi-stage builds:
- You can run builds in parallel.
- You can separate build files from binaries.

```bash
docker build --build-arg="GO_VERSION=1.22" .
```

## Lesson 5: Docker Network Drivers

### Create a Network

```bash
docker network create --driver bridge bridge-network
```

### Connect Containers to the Network

```bash
docker network connect bridge-network app-1 \
&& \
docker network connect bridge-network app-2
```

- Use `disconnect` for the opposite.

### Run a Container with Volume Mounting

```bash
docker run -d -v /root/app-1:/usr/share/nginx/html --name app-1 --network host nginx:alpine
```

- Mounts the container on the specified directory and adds it to the host network using the `nginx:alpine` image.

### Test with Curl

```bash
curl localhost:80
```

## Lesson 6: Port Forwarding in Docker

### Connect via SSH to the Host Named `node01`

```bash
ssh node01
```

## Lesson 7

- `-d` is for detached mode.

## Lesson 8: Mount and Bind

### List Contents in the Directory Using Docker

```bash
docker exec sample-app sh -c "ls /usr/share/nginx/html"
```

### Remove a Line from a File

```bash
sed -i '3d' file.txt
```

## Lesson 9: Using Environment Variables

- Use `env` and `-e` in the commands.

## Lesson 10: Volume Mounts

### Verify the Volume

```bash
docker volume inspect sample-volume
```

### Run a Container with Volume Mounting

```bash
docker run -d -p 80:80 -v sample-volume:/usr/share/nginx/html --name sample-app nginx:alpine
```

### Where the Volume is Linked

```
/var/lib/docker/volumes/sample-volume/_data/index.html
```
