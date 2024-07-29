docker build -t cmd-echo .  


Explore CMD of cmd-echo :  
 

docker inspect cmd-echo | jq .[0].ContainerConfig.Cmd  


Run the container with default values:  


docker run --rm cmd-echo  


Run the container with updated CMD command:  


docker run --rm cmd-echo date  