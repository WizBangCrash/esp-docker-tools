FROM ubuntu:16.04 as builder

# Add a user because we can't build the toolchain with root
RUN groupadd -g 1000 docker && useradd docker -u 1000 -g 1000 -s /bin/bash --no-create-home
# Create the build directory
RUN mkdir /build && chown docker:docker /build

# Install build dependencies
RUN apt-get update && apt-get install -y \
  make unrar-free autoconf automake libtool gcc g++ gperf \
  flex bison texinfo gawk ncurses-dev libexpat-dev python-dev python python-serial \
  sed git unzip bash help2man wget bzip2 libtool-bin

# Get the esp-open-sdk
# Build the esp-open-sdk
RUN su docker -c " \
    git clone --recursive https://github.com/pfalcon/esp-open-sdk.git /build/esp-open-sdk ; \
    cd /build/esp-open-sdk ; \
    make STANDALONE=n ; \
"
# Clean out large and now unnecessary crosstool-NG build area
RUN rm -rf /build/esp/esp-open-sdk/crosstool-NG

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y make python python-serial

COPY --from=builder /build/esp-open-sdk/xtensa-lx106-elf /opt/xtensa-lx106-elf
# Add the esp-open-sdk bin folder to PATH
ENV PATH /opt/xtensa-lx106-elf/bin:$PATH