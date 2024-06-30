![docker image workflow](https://github.com/mnahmad/python_ds_env/actions/workflows/docker-image.yml/badge.svg)
# python_ds_env
Python data science dockerized environment.

__Note:__ The motivation to create this repo/image came from [this](https://www.linkedin.com/pulse/python-climate-data-analysis-tutorial-code-ali-ahmadalipour/?utm_source=substack&utm_medium=email) blog post. This repo is based on [this](https://towardsdatascience.com/a-working-environment-for-geospatial-analysis-with-docker-python-and-postgresql-670c2be58e0a) post by Duccio Aiazzi.


# How to build
It is not possible to preinstall all libs to this image, thus, feel free to make changes and build your own image.

# How to run
This Image is hosted on dockerhub at [this](https://hub.docker.com/r/mnabiahmad/python_ds_env) link, pull the image as showing below.  

```
docker run --rm -it mnabiahmad/python_ds_env


better pass volume with your code

```


# Extension install in VS Code.


You need to install `Visual Studio Code Dev Containers` VS Code extension

Note, once container is selected and attached, "Python extension for Visual Studio Code" needs to be installed and then correct interprate should be selected (VS Code will ask for it)

# How to use 

1. start VS Code 
2. start docker image 
3. press f1 and then "dev container -  attached to running container " 
4. create new py or notebook and work on it. 

