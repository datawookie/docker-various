# https://github.com/ur-whitelab/docker-images/blob/master/python/jupyter-nbextensions/Dockerfile

# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run jupyter notebooks with the nb extensions enabled

# FROM jupyter/scipy-notebook
FROM jupyterhub/jupyterhub:0.9.3
MAINTAINER Andrew White <andrew.white@rochester.edu>

RUN apt-get update && \
    apt-get install -y \
        whois && \
    apt-get clean -y

# RUN conda install -c conda-forge jupyter_contrib_nbextensions
# RUN conda clean -a -y

RUN pip install jupyter_contrib_nbextensions

RUN useradd jupyter -m -p `mkpasswd jupyter` -s /bin/bash

USER jupyter

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellcheck/main
RUN jupyter nbextension enable chrome-clipboard/main
RUN jupyter nbextension enable rubberband/main
