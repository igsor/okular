#
# Sets up a building environment for a modified version of Okular.
# 
# $ docker build .
# $ docker images
# [Lists some images, with IDs. Identify the right one (probably the top)]
# $ docker run -i -t [ID]
# [You're dropped into a bash inside the image]
# # cd /root/okular/build
# # make
# [This might take some time]
# [After building, copy the file /root/okular/build/lib/okularpart.so to
#  your okular installation.]
# 
# By Matthias Baumgartner, 2016
#
#
#
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Install build toolchain
RUN apt-get update && \
    apt-get install -y git cmake g++

# Install essential build dependencies
RUN apt-get install -y  kdelibs5-dev \
                        libqimageblitz-dev \
                        zlib1g-dev \
			wget

# Install optional build dependencies
RUN apt-get install -y  pkg-config \
                        libpoppler-qt4-dev \
                        libfreetype6-dev \
                        libtiff5-dev \
                        libspectre-dev \
                        libkexiv2-dev \
                        libdjvulibre-dev \
                        libepub-dev \
                        libchm-dev \
                        libqca2-dev \
                        libqmobipocket-dev


# Get sources
RUN git clone -b edit3 https://github.com/igsor/okular /root/okular

# CMake
RUN mkdir /root/okular/build && \
    cd /root/okular/build && \
    cmake ..

# build!
RUN cd /root/okular/build && \
    make

ENTRYPOINT ["/bin/bash"]
