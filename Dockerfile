FROM ubuntu:latest

LABEL maintainer="Muhammad Ahmad <mnabiahmad@gmail.com>"

## Set Enviorment variables
#ENV LANG=C.UTF-8 LC_ALL=C>UTF-8

## Update package manager
#RUN apt-get update
RUN apt-get update && apt-get -y upgrade


RUN apt-get install -y wget
RUN apt-get install -y bzip2
# https://ubuntu.com/server/docs/security-trust-store
RUN apt-get install -y ca-certificates
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y git-core
RUN apt-get install -y pkg-config
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-virtualenv
RUN apt-get install -y unzip
RUN apt-get install -y software-properties-common
RUN apt-get install -y llvm  # llvm: crossplatoform C, C++ compiler


## Install gdal
RUN apt install -y gdal-bin

# added by repo owner
#RUN add-apt-repository ppa:ubuntugis/ppa
#RUN apt-get install libgdal-dev
#RUN apt install -y python-gdal
RUN apt install -y python3-gdal



## clean
RUN apt-get clean



## Folder/file setup
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash

VOLUME /ds
WORKDIR /ds

SHELL ["/bin/bash", "-c"] # tell docker which shell to use (otherwise source coomand cannot be found)


# setp virutla env (to avoid errors like externally-managed-environment, read PEP 668 – Marking Python base environments as “externally managed”)
RUN apt install python3.12-venv # On Debian/Ubuntu systems, you need to install the python3-venv
#RUN python3 -m venv /ds/.venv
RUN virtualenv /ds/.venv
RUN source /ds/.venv/bin/activate

ENV pip_venv "/ds/.venv/bin/"

## Install python pkgs
RUN ${pip_venv}pip3 install --require-virtualenv --upgrade pip


RUN ${pip_venv}pip3 install numpy
RUN ${pip_venv}pip3 install scipy
RUN ${pip_venv}pip3 install geopandas

#pandasai
#RUN pip3 install psycopg2
#RUN pip  install psycopg2
#RUN pip3 install sqlalchemy
RUN ${pip_venv}pip3 install networkx
RUN ${pip_venv}pip3 install osmnx

#RUN pip install numpy scipy geopandas psycogp2 sqlalchmey networkx osmnx

# jupyter install
# try installing The Jupyter Server provides the backend (i.e. the core services, APIs, and REST endpoints) for Jupyter # web applications like Jupyter notebook, JupyterLab, and Voila.
#RUN ${pip_venv}pip3 install jupyter-server

RUN ${pip_venv}pip3 install jupyter
# TO run jupyter code, we need ipython and ipythonkernal
RUN ${pip_venv}pip3 install ipython ipykernel

#CMD [ "/bin/bash" ]

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Define environment variable
ENV NAME World

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
