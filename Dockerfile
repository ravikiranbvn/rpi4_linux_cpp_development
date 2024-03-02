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
        unzip \
        gcc g++ gperf bison flex texinfo help2man make libncurses5-dev \
        python3-dev libtool automake libtool-bin gawk wget rsync git patch \
        unzip xz-utils bzip2 ca-certificates && \
        apt-get clean autoclean && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /home/${USERNAME}/

# Change ownership of the working directory to builduser
RUN chown -R ${USERNAME}:${GROUPNAME} /home/${USERNAME}/

# Switch to the builduser
USER ${USERNAME}

# Clean up
WORKDIR /home/${USERNAME}/
RUN rm -rf crosstool-ng

# Clone Crosstool-NG repository
RUN git clone https://github.com/crosstool-ng/crosstool-ng.git

# Set up Crosstool-NG
WORKDIR /home/${USERNAME}/crosstool-ng
RUN git checkout crosstool-ng-1.26.0 -b 1.26.0 && \
    ./bootstrap && \
    ./configure --prefix=/home/${USERNAME}/crosstool-ng && \
    make -j$(nproc) && \
    make install

# Add the toolchain to PATH
ENV PATH="/home/${USERNAME}/crosstool-ng/bin:${PATH}"

RUN echo $PATH

# Set up configuration for Raspberry Pi 4 (aarch64)
RUN ct-ng aarch64-rpi4-linux-gnu

# Build the toolchain
RUN ct-ng build

# Mount the local disk to /workspace in the container
VOLUME /workspace