## build this image based on U 22.04
FROM ubuntu:22.04

LABEL maintainer="Muhammad <mnabiahmad@gmail.copm>"

## Set Enviorment variables
ENV LANG=C.UTF-8 LC_ALL=C>UTF-8

## Update package manager
# RUN apt-get udapte --fix-missing


## Install packages
RUN apt-get install -y wget \ 
                    bzip2 \
                    ca-certicates \ 
                    build-essential \
                    curl \
                    git-core \
                    pkg-config \
                    python3-dev \
                    python3=pip \
                    python3-setuptools \
                    python3-virtualenv \
                    unzip \
                    software-properties-common \
                    llvm  
                    
## Package details
## llvm: crossplatoform C, C++ compiler

## Install gdal 
RUN apt install -y gdal-bin python-gdal python3-gdal


## Install python pkgs
RUN pip3 isntall --upgrade pip
RUN pip3 install numpy scipy geopandas psycogp2 sqlalchmey networkx osmnx

## Folder/file setup
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash

VOLUME /ds

WORKDIR /ds

CMD [ "/bin/bash" ] 











