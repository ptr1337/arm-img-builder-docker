# arm-image-builder-docker

For easy building of the arm-images we have created a docker image without installing anything on its host system.
You have the possibility to build the docker image yourself or download it from dockerhub.
The prebuilt docker images are available for the following architectures:

* amd64
* arm64

Here you find the image on the docker-hub:

[pttrr/arm-img-builder](https://hub.docker.com/repository/docker/pttrr/arm-img-builder)

We will provide two different tags: 
> cross --> for cross compiling on amd64 and arm64
> native --> for native compiling on arm64

## Installing docker and docker-compose

Docker and docker-compose are for following operating systems available:

* Linux (all distros)
* Mac
* Windows

You will find how to install docker and docker-compose for your operating system here:

https://docs.docker.com/get-docker/

If you got problems using docker-compose, try installing it with pip:

`sudo pip3 -v install docker-compose`


## Running the container

### Clone the whole thing

`git clone --recurse-submodules https://github.com/ptTrR/arm-image-builder-docker.git && cd arm-image-builder-docker && git submodule update --remote`

### Updating submodules
`git submodule update --remote`

### Pulling and start the image from docker-hub

`docker-compose pull && docker-compose up -d`

### Building the container
Change in the docker-compose.yml:
```
#    build: .  #uncomment for building
    image: pttrr/arm-img-builder:cross
#   image: pttrr/arm-img-builder:native # uncomment for native compiling
```
to:
```
    build: .  #uncomment for building
    image: pttrr/arm-img-builder:cross
  #  image: pttrr/arm-img-builder:native # uncomment for native compiling  
```
Then run:

`docker-compose up -d --build`

### Exec into the container

`docker exec -it arm-img-builder bash`

You can use the container for building:

* [rpi-img-builder](https://github.com/pyavitz/rpi-img-builder) is located at /build/rpi-img-builder
* [debian-image-builder](https://github.com/pyavitz/debian-image-builder) is located at /build/debian-img-builder
* [Native-Kernel-Compiler](https://github.com/pyavitz/builddeb) is located at /build/kernelbuild

## Usage of the containers builder:

Just take watch at our [Wiki](https://wiki.arm-image-builder.xyz) 

## Maintenance and Troubleshooting

### Clearing up the cache and data

For clearing up your directory and builded cache in the container you can use following commands:

```
make cleanup
make purge
make purge-all
```
### Clearing docker cache, containers, images, and volumes

If you want to clear up your full docker system run following commands:

```
docker system prune -a
docker system prune --volumes
```

## Support


For more infos watch at our [Wiki](https://wiki.arm-image-builder.xyz/) or [Github](https://github.com/pyavitz).

Should you come across any bugs, feel free to either open an issue on GitHub or talk with us directly by joining our channel on Freenode; [`#debianarm-port`](irc://irc.freenode.net/#debianarm-port)
