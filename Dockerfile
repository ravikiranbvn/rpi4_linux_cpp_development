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
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends\
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
        unzip \
        gcc g++ gperf texinfo help2man \
        libtool automake libtool-bin gawk patch \
        xz-utils bzip2 ca-certificates && \
        apt-get clean autoclean && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /opt/compiler

# Copy the x-tools toolchain directory into the container
COPY x-tools /opt/compiler

# Set permissions for the toolchain directory to allow access for builduser
RUN chown -R ${USERNAME}:${GROUPNAME} /opt/compiler

# Set up working directory
WORKDIR /home/${USERNAME}/

# Change ownership of the working directory to builduser
RUN chown -R ${USERNAME}:${GROUPNAME} /home/${USERNAME}/

# Switch to the builduser
USER ${USERNAME}

# Set environment variables for the toolchain paths
ENV PATH="/opt/compiler/aarch64-rpi4-linux-gnu/bin:${PATH}"
