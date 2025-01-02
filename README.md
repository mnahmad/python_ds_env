![docker image workflow](https://github.com/mnahmad/python_ds_env/actions/workflows/docker-image.yml/badge.svg)
# python_ds_env
Python data science dockerized environment.

__Note:__ The motivation to create this repo/image came from [this](https://www.linkedin.com/pulse/python-climate-data-analysis-tutorial-code-ali-ahmadalipour/?utm_source=substack&utm_medium=email) blog post. This repo is based on [this](https://towardsdatascience.com/a-working-environment-for-geospatial-analysis-with-docker-python-and-postgresql-670c2be58e0a) post by Duccio Aiazzi.

# Dockerfile explanation 
I always feel that few of the items in Dockerfiles should be explained by developers, thus, see below. 

## Shell change
As I was forced to use virutal env, I was tying to active virutal env but due to diff shell, source commands could be found so I had to explicitly tell docker which shell I need. 

```bash 
SHELL ["/bin/bash", "-c"]
```

## Virtual environment issue
Since I am using ubuntu:latest latest image, python3 came installed along pip, the pip package is being managed by OS thus when I try to upgraded pip, it cause error, the error is 

<details>

```bash
=> ERROR [25/32] RUN pip3 install --upgrade pip --isolated                                                                                                                                                                                                                                                                              0.6s
------
 > [25/32] RUN pip3 install --upgrade pip --isolated:
#29 0.530 error: externally-managed-environment
#29 0.530
#29 0.530 × This environment is externally managed
#29 0.530 ╰─> To install Python packages system-wide, try apt install
#29 0.530     python3-xyz, where xyz is the package you are trying to
#29 0.530     install.
#29 0.530
#29 0.530     If you wish to install a non-Debian-packaged Python package,
#29 0.530     create a virtual environment using python3 -m venv path/to/venv.
#29 0.530     Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
#29 0.530     sure you have python3-full installed.
#29 0.530
#29 0.530     If you wish to install a non-Debian packaged Python application,
#29 0.530     it may be easiest to use pipx install xyz, which will manage a
#29 0.530     virtual environment for you. Make sure you have pipx installed.
#29 0.530
#29 0.530     See /usr/share/doc/python3.12/README.venv for more information.
#29 0.530
#29 0.530 note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
#29 0.530 hint: See PEP 668 for the detailed specification.
------
executor failed running [/bin/bash -c pip3 install --upgrade pip --isolated]: exit code: 1
```
</details>

I tried many solutions but the only one worked for me was implementing virtual environment and activating it plus adding the pull path of virtual env into the pip command, see below

```bash
RUN apt install python3.12-venv
RUN virtualenv /ds/.venv
RUN source /ds/.venv/bin/activate

ENV pip_venv "/ds/.venv/bin/"

## Install python pkgs
RUN ${pip_venv}pip3 install --require-virtualenv --upgrade pip

```

You can read more about it issue if you search PEP668. 

# How to build
It is not possible to preinstall all libs to this image, thus, feel free to make changes and build your own image.


```bash
docker build . -t python_ds_env:2.0
```
where
-t or -tags is for tags

# How to run
This Image is hosted on dockerhub at [this](https://hub.docker.com/r/mnabiahmad/python_ds_env) link, pull the image as showing below.  

```bash
docker run --rm -it -v your-path-to-files:/ds mnabiahmad/python_ds_env

docker run --rm -it -v /Users/muhammad/mynotebooks_repos/DataScience_notebooks:/ds -p 8888:8888  mnabiahmad/python_ds_env:2.0

```

__Note__ this is still work in progress as jupyter note is not not working. 

# Extension needed for VS Code.

You need to install `Visual Studio Code Dev Containers` VS Code extension



# How to use 

1. start VS Code 
2. start docker image 
3. press f1 and then "dev container -  attached to running container " 
4. create new py or notebook and work on it. You have to install Jupyter Extension for Visual Studio Code (will try to add this to docker image as well)


