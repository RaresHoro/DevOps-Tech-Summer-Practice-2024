
docker build -t cmd-echo .  

Explore CMD of cmd-echo :  

docker inspect cmd-echo | jq .[0].ContainerConfig.Cmd  

Run the container with default values:  

docker run --rm cmd-echo  

Run the container with updated CMD command:  

docker run --rm cmd-echo date  

Lesson 4  Docker file best practices 

cat > /root/Dockerfile <<EOF  
FROM alpine  
ENTRYPOINT ["echo", "hi, from container!"]  
EOF  

# syntax=docker/dockerfile:1
FROM golang:1.21-alpine 
WORKDIR /src # cached
COPY go.mod go.sum /src/  
RUN go mod download 
COPY . .
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]

MultiStage Builds  
With multi-stage builds:  
- you can run builds in parallel  
- you can separate build files from binaries  

docker build --build-arg="GO_VERSION=1.22" .  build with a specific version

Lesson 5 Docker : Network drivers  

docker network create --driver bridge bridge-network  
create a network  

docker network connect bridge-network app-1 \
&& \
docker network connect bridge-network app-2  use disconnect for the oppsite

docker run -d -v /root/app-1:/usr/share/nginx/html --name app-1 --network host nginx:alpine  
mount container on the specified directory and add it to the hist network, uuse nginx/:alpine image 

curl localhost:80  get request  

Lesson 6 PArt-forwarding in docker  

Connect via SSH to the host named node01 .  
ssh node01  

Lesson 7 

-d is for detached mode

Lesson 8 Mount and bind  


docker exec sample-app sh -c "ls /usr/share/nginx/html" list contents in the dirctory using diocker  

sed -i '3d' file.txt  remove a line from the file  

Lesson 9 Using environment Vraiables  

with env and -e in the commands  

Lesson 10 volume mounts 

docker volume inspect sample-volume verify the volume  
docker run -d -p 80:80 -v sample-volume:/usr/share/nginx/html --name sample-app nginx:alpine  
the way to attach volume 

/var/lib/docker/volumes/sample-volume/_data/index.html  
Where the volume is lnked  
