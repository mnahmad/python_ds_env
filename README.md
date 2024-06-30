![docker image workflow](https://github.com/mnahmad/python_ds_env/actions/workflows/docker-image.yml/badge.svg)
# python_ds_env
Python data science docker based environment

__Note:__ The motivation to create this repo/image came because of [this](https://www.linkedin.com/pulse/python-climate-data-analysis-tutorial-code-ali-ahmadalipour/?utm_source=substack&utm_medium=email) blog post. This repo is based on [this](https://towardsdatascience.com/a-working-environment-for-geospatial-analysis-with-docker-python-and-postgresql-670c2be58e0a) post by Duccio Aiazzi.


# How to run

```
docker run --rm -it mnabiahmad/python_ds_env


better pass volume with your code

```


# Extension install in VS Code.
Note, once container is selected and attached, "Python extension for Visual Studio Code" needs to be installed and then correct interprate should be selected (VS Code will ask for it)

also install `Visual Studio Code Dev Containers` VS Code extension



# How to use 

1. start VS Code 
2. start docker image 
3. press f1 and then "dev container -  attached to running container " 
4. create new py or notebook and work on it. 

