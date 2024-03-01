# Use a base image with necessary tools (e.g., Ubuntu 20.04)
FROM ubuntu:20.04

# Set the username to builduser
ARG USERNAME=builduser
ARG GROUPNAME=builduser
ARG UID=1000
ARG GID=1000

# Create the builduser group and user
RUN groupadd -g ${GID} ${GROUPNAME} && \
    useradd -m -u ${UID} -g ${GROUPNAME} -s /bin/bash ${USERNAME}

# Install required packages
# Install required packages, including Linux tools for the kernel version of the host machine
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        vim \
        tree \
        htop \
        openssh-client \
        linux-tools-common \
        linux-tools-generic \
        qemu \
        qemu-utils \
        qemu-kvm \
        virt-manager \
        libvirt-daemon-system \
        libvirt-clients \
        bridge-utils \
        qemu-system-arm \
        valgrind \
        mlocate \
        crossbuild-essential-armhf \
        git \
        bc \
        bison \
        flex \
        libssl-dev \
        make \
        libc6-dev \
        libncurses5-dev \
        fuse \
        gdb-multiarch \
        autoconf \
        openocd \
        clang \
        cmake \
        pkg-config \
        libboost-all-dev \
        libyaml-cpp-dev \
        libyaml-dev \
        strace \
        lsof \
        tcpdump \
        file \
        sudo \
        curl \
        nano \
        tmux \
        man-db \
        wget \
        python3 \
        unzip

# Set up working directory
WORKDIR /home/${USERNAME}/

# Change ownership of the working directory to builduser
RUN chown -R ${USERNAME}:${GROUPNAME} /home/${USERNAME}/

# Switch to the builduser
USER ${USERNAME}

# Clone Crosstool-NG repository
RUN git clone https://github.com/crosstool-ng/crosstool-ng.git

# Set up Crosstool-NG
WORKDIR /home/${USERNAME}/crosstool-ng
RUN git checkout remotes/origin/next && \
    ./bootstrap && \
    ./configure --enable-local && \
    make && \
    make install

# Clean up
WORKDIR /home/${USERNAME}/
RUN rm -rf crosstool-ng

# Set up configuration for Raspberry Pi 4 (aarch64)
RUN ct-ng armv8-rpi4-linux-gnu

# Build the toolchain
RUN ct-ng build

# Add the toolchain to PATH
ENV PATH="/home/${USERNAME}/x-tools/armv8-rpi4-linux-gnu/bin:${PATH}"

# Mount the local disk to /workspace in the container
VOLUME /workspace