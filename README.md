```
All the resources in this repository are ONLY for learning purposes!
```

# rpi4_linux_cpp_development
```
- This is a simple demonstration to showcase the build docker with rpi4 kernel, tools and environment
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

### brief commands
```bash
docker build --rm --tag <container:tag> -f Dockerfile .
docker run <container:tag>
docker push <container:tag>
docker pull <container:tag>
docker run --rm -it <container:tag>
```

## 3. Documentation

### Tutorial on docker file:        [Dockerfile](https://docs.docker.com/get-started/02_our_app/)
### Tutorial on Github yaml file:   [Github](https://docs.github.com/en/actions/quickstart)  
