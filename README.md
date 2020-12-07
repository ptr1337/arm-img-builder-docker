# arm-image-builder-docker

For easy building of the arm-images we have created a docker image without installing anything on its host system.
You have the possibility to build the docker image yourself or download it from dockerhub.
The prebuilt docker images are available for the following architectures:
* amd64
* arm64

Here you find the image on the docker-hub:

[pttrr/arm-img-builder](https://hub.docker.com/repository/docker/pttrr/arm-img-builder)

We will provide two different tags: 

## Installing docker and docker-compose

Docker and docker-compose are for following operating systems available:

* Linux (all distros)
* Mac
* Windows

You will find how to install docker and docker-compose for your operating system here:

https://docs.docker.com/get-docker/

Docker-Compose Installion for using the newest version
https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl

## Running arm-img-builder

### Clone the whole thing :

`git clone --recurse-submodules https://github.com/ptTrR/arm-image-builder-docker.git && cd arm-image-builder-docker && git submodule update --remote`

### For updating:
`git submodule update --remote`

### Pulling and start the image from docker-hub:

`docker-compose pull && docker-compose up -d`

### for building: 
Change in the docker-compose.yml:
```
#    build: .  #uncomment for building
    image: pttrr/arm-img-builder:cross
#   image: pttrr/arm-img-builder:native # uncomment for native compiling
```
to:
```
    build: .  #uncomment for building
  #  image: pttrr/arm-img-builder:cross
  #  image: pttrr/arm-img-builder:native # uncomment for native compiling  
```
Then run:

`docker-compose up -d --build`

### Exec into the container:

`docker exec -it arm-img-builder bash`

The container is automatically downloading all his three repos from pyavitz who is providing the building files for:

* rpi-img-builder is located at /build/rpi-img-builder
* debian-image-builder is located at /build/debian-img-builder
* Native-Kernel-Compiler is located at /build/kernelbuild


## Example for building a raspberry image

After you got the container successfully running and exec into that you can run following commands:

### Pulling latest Changes from Github
```
cd /build
git submodule update --remote
```

### Menu-Interface
```
make config     # Create user data file (Foundation Kernel)
make mlconfig   # Create user data file (Mainline Kernel)
make menu       # Open menu interface
make dialogrc   # Set builder theme (optional)
```

### Building the kernel
```
make kernel       #Pi4
make rpi3-kernel  #Pi3
make rpi-kernel   #Pi0
```
### Building the rootfs
```
make rootfs  (arm64)
make rootsv6 (armel)
```
### Building the bootable image
```
make image        #Pi4
make rpi3-image   #Pi3
make rpi-image    #Pi0
```
After building your image, you find it on your hosts work directory. 

## Support


For more infos watch at our [Wiki](https://wiki.arm-image-builder.xyz/) or [Github](https://github.com/pyavitz/rpi-img-builder).

Should you come across any bugs, feel free to either open an issue on GitHub or talk with us directly by joining our channel on Freenode; [`#debianarm-port`](irc://irc.freenode.net/#debianarm-port)
