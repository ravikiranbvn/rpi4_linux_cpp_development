```
All the resources in this repository are ONLY for learning purposes!
```

# rpi4_linux_cpp_development
```
- This project build a docker with ubuntu 20.04, QEMU, toolchain setup and C/C++ environment using VSCode/CMake.
```

# Environment setup

## 1. Setup Docker Container (Ubuntu apt version)

The installation of docker is described in detail on the official Docker website: [Docker installation on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

### check if group exists
```bash
sudo getent group docker 
add username to docker group
sudo usermod -aG docker username
```

## 2. windows

https://docs.docker.com/desktop/install/windows-install/

## 3. Tool chain set up using Crosstool-NG

```bash
$ git clone https://github.com/crosstool-ng/crosstool-ng
$ cd crosstool-ng/

# Switch to the latest release
$ git checkout crosstool-ng-1.26.0 -b 1.26.0

$ ./bootstrap
$ ./configure --prefix=${PWD}
$ make
$ make install
$ export PATH="${PWD}/bin:${PATH}"

# configure
$ ct-ng menuconfig

# set for rpi4
$ ct-ng aarch64-rpi4-linux-gnu

# build
ct-ng build

# check config file
ct-ng .config

# sample config
ct-ng list-samples
ct-ng show-aarch64-rpi4-linux-gnu
```

## 4. Docker commands
```bash
docker build --rm --tag <container:tag> -f Dockerfile .
docker run <container:tag>
docker push <container:tag>
docker pull <container:tag>
docker run --rm -it <container:tag>
```

## 5. project specific
```bash

# build docker
make build

# run docker
make run

# to run hello-world ex
$ cd rpi4_linux_cpp_development/src/build
$ cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
$ make

# to pull docker image
$ docker pull rkbvn89/rpi4_linux_dev:latest
```

## 6. Documentation

### Tutorial on docker file:        [Dockerfile](https://docs.docker.com/get-started/02_our_app/)
### Tutorial on Github yaml file:   [Github](https://docs.github.com/en/actions/quickstart)  
