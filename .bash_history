ls
cd ..
ls
cd src/
ls
cat helloworld.cpp 
nano helloworld.cpp 
exit
ls
cd ..
ls
clear
exit
ls
cd ..
ls
clear
exit
ls
cd ..
ls
cd src/
ls
cd ..
ls
clear
ls
cd crosstool-ng/
ls
ls
cd ..
ls
cd crosstool-ng/
ls
cd ..
ls
clear
ls
cd /home/
ls
cd builduser/
ls
cd crosstool-ng/
ls
cd ..
clear
exit
ls
cd workspace/
ls
cd ..
ls
exit
ls
ls
pwd
clear
cat Dockerfile 
clear
ls
clear
ls
cat rpi-arm64-toolchain.cmake 
clear
ls
clear
exit
cd /opt/
ls
cd compiler/
ls
cd aarch64-rpi4-linux-gnu/
ls
cd bin/
ls
cd ..
cd ..
cd ..
cd ..
clear
exit
ls
cd src/
ls
rm -rf build/
mkdir build
cd build/
 cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
uname -a
lscpu
clear
neofetch
cat /os/release
cat /etc/os-release
make
ls
cd ..
ls
rm -rf build/
mkdir build
cd build/
 cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
ldd /bin/bash
ENV PATH="/opt/compiler/aarch64-rpi4-linux-gnu/bin:${PATH}"
export PATH="/opt/compiler/aarch64-rpi4-linux-gnu/bin:${PATH}"
make
 cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
cd ..
rm -rf build/
mkdir build
cd build/
ls
 cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
ls
uname -r
clear
ls
clear
lsb_release -a
cat /etc/os-release 
clear
uname -r
uname -a
clear
ls
make
cd ..
ls
rm -rf build/
ls
mkdir build
cd build/
 cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
ldd --version | grep libc
ls
cd
cd /opt/compiler/
ls
cd aarch64-rpi4-linux-gnu/
ls
cd aarch64-rpi4-linux-gnu/
ls
cd sysroot/
ls
cd lib
ls
cd
ls
cd /usr/local/
ls
cd lib/
ls
cd ..
cd ..
cd ..
ls
cd /home/builduser/
ls
clear
ls
cd src/
ls
clear
ls
cat CMakeLists.txt 
clear
ls
cd build/
make
cd ..
ls
cd build/
ls
ls
exit
ls
clear
ls
cd src/
ls
builtin 
cd build/
ls
clear
cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
ls
cd src/
ls
rm -rf build/
mkdir build
cd build/
ls
cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
cat /lib/libc.so.6
ldd $(which ls) | grep libc
file /lib/x86_64-linux-gnu/libc.so.6
ldd --version
exit
ls
cd src/
ls
clear
ls
rm -rf build/
mkdir build
ls
cd build/
clear
cmake -DCMAKE_TOOLCHAIN_FILE=/../../rpi-arm64-toolchain.cmake ..
qemu
cd ..
cd ..
qemu-arm
qemu --help
qemu -h
qemu-system-arm --help
clear
time
ks
ls
clear
ls
uname -a
lsb_release -a
ldd --version
exit
