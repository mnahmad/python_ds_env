FROM ubuntu:latest


## Set Enviorment variables
#ENV LANG=C.UTF-8 LC_ALL=C>UTF-8

## Update package manager
#RUN apt-get update
RUN apt-get update && apt-get -y upgrade

#upgrade

RUN apt-get install -y wget 
RUN apt-get install -y bzip2 
RUN apt-get install -y ca-certicates 
RUN apt-get install -y build-essential 
RUN apt-get install -y curl 
RUN apt-get install -y git-core 
RUN apt-get install -y pkg-config 
RUN apt-get install -y python3-dev 
RUN apt-get install -y python3=pip 
RUN apt-get install -y python3-setuptools 
RUN apt-get install -y python3-virtualenv 
RUN apt-get install -y unzip 
RUN apt-get install -y software-properties-common 
RUN apt-get install -y llvm  
             
## Package details
## llvm: crossplatoform C, C++ compiler

## Install gdal 
RUN apt install -y gdal-bin python-gdal python3-gdal


## clean 
RUN apt-get clean

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












