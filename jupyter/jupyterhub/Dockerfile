FROM jupyterhub/jupyterhub:0.9.3
MAINTAINER Andrew Collier <andrew@exegetic.biz>

# Install system software.
#
RUN apt-get update && \
    apt-get install -y \
        apg \
        build-essential \
        curl \
        git \
        graphviz \
        htop \
        locate \
        make \
        openssh-client \
        software-properties-common \
        unzip \
        vim \
        wget \
        whois && \
    apt-get clean -y

#
# RUN apt-get update && apt-get install -y julia
# RUN apt-get update && apt-get dist-upgrade julia
#
# RUN add-apt-repository -y ppa:staticfloat/juliareleases
# RUN apt-get update && apt-get install -y julia
#
# Install Julia packages.
#
# RUN julia -e 'Pkg.add("IJulia")'
#
# Install Python packages.
#
RUN pip install \
        bokeh==0.13.0 \
        corner==2.0.1 \
        findspark==1.3.0 \
        graphviz==0.8.3 \
        ipywidgets==7.4.2 \
        jupyter==1.0.0 \
        # keras==2.0.6 \
        lightgbm==2.0.6 \
        matplotlib==3.0.0 \
        nltk==3.2.4 \
        numpy==1.15.1 \
        openpyxl==2.5.8 \
        pandas==0.20.3 \
        Pillow==4.2.1 \
        pystan==2.18.0.0 \
        pytesseract==0.1.7 \
        scikit-learn==0.20.0 \
        scipy==1.1.0 \
        Scrapy==1.4.0 \
        seaborn \
        statsmodels==0.8.0 \
        tables==3.4.4 \
        # tensorflow==1.11.0 \
        # theano==0.9.0 \
        xgboost==0.80 \
        xlrd==1.1.0

# Bleeding edge packages from GitHub.
#
RUN pip install \
        git+git://github.com/arviz-devs/arviz.git@1962f62d047af48eb170ff93041701b4614af328 \
        git+https://github.com/rasbt/watermark#egg=watermark

# CONFIGURATION ----------------------------------------------------------------------------------

# ADD jupyterhub_config.py /srv/jupyterhub/

# Location of this file:
#
# - $ jupyter --paths
# - http://jupyter.readthedocs.io/en/latest/projects/jupyter-directories.html.
#
# Global location: /etc/jupyter/
# Local location:  ~/.jupyter/
#
# ADD jupyter_notebook_config.py /etc/jupyter/

# -------------------------------------------------------------------------------------------------

# User accounts.
#
# Default account (insecure; delete this user once everything is running).
#
RUN useradd jupyter -m -p `mkpasswd jupyter` -s /bin/bash
#
# Script to create other accounts.
#
ADD generate-users /usr/local/bin/

# EXTENSIONS --------------------------------------------------------------------------------------

# https://github.com/ipython-contrib/jupyter_contrib_nbextensions
# https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator

# To see the "Configurator" menu, from a notebook select Edit -> nbextensions config (last item).

# To see information about installed extensions do:
#
# $ jupyter nbextension list

RUN pip install \
        jupyter_contrib_nbextensions==0.5.0 \
        jupyter_nbextensions_configurator==0.4.0 && \
    jupyter contrib nbextension install --system --symlink && \
    jupyter nbextensions_configurator enable --system && \
    jupyter nbextension enable varInspector/main --system && \
    jupyter nbextension enable toc2/main --system && \
    jupyter nbextension enable spellchecker/main --system && \
    jupyter nbextension enable rubberband/main --system && \
    jupyter nbextension enable highlighter/highlighter --system && \
    jupyter nbextension enable hide_header/main --system && \
    jupyter nbextension enable freeze/main --system && \
    jupyter nbextension enable exercise2/main --system && \
    jupyter nbextension enable exercise/main --system && \
    jupyter nbextension enable collapsible_headings/main --system && \
    jupyter nbextension enable codefolding/main --system && \
    jupyter nbextension enable codefolding/edit --system && \
    jupyter nbextension enable cell_filter/cell_filter --system

# SSL ---------------------------------------------------------------------------------------------

# Self-signed certificate.
#
# - In jupyterhub_config.py uncomment c.JupyterHub.ssl_cert and c.JupyterHub.ssl_key.
# - Run with port mapping 443:8000.
#
# With the self-signed certificate you'll have to click on Advanced when you visit the
# site and choose to proceed (despite the dire consequences!). Your browser will indicate
# that the connection is not secure, but this just means that the certificate can't be
# validated. Communication is still happening via HTTPS.
#
# RUN openssl req -batch -x509 -nodes -days 365 -newkey rsa:1024 \
#         -keyout jupyterhub.key -out jupyterhub.crt && \
#     chmod 600 jupyterhub.crt jupyterhub.key

# Letsencrypt.
#
# ADD privkey.pem /etc/ssl/certs/privkey.pem
# ADD fullchain.pem /etc/ssl/certs/fullchain.pem
# RUN chmod 0600 /etc/ssl/certs/privkey.pem /etc/ssl/certs/fullchain.pem
