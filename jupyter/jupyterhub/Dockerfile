# =============================================================================
# JUPYTER NOTEBOOK DOCKER IMAGE
# =============================================================================
#
# -----------------------------------------------------------------------------
#
FROM jupyterhub/jupyterhub:0.9.3
MAINTAINER Andrew Collier <andrew@exegetic.biz>
#
# Install system software.
#
# - build-essential: So that we can compile xgboost from source.
#
RUN apt-get update && \
    apt-get install -y \
        apg \
        build-essential \
        curl \
        git \
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
RUN pip install jupyter==1.0.0 \
                corner==2.0.1 \
		keras==2.0.6 \
         	lightgbm==2.0.6 \
        	matplotlib==3.0.0 \
		nltk==3.2.4 \
		numpy==1.15.1 \
		# orange3==3.4.5 \
		# orange3-associate==1.1.3 \
		pandas==0.20.3 \
		Pillow==4.2.1 \
               pystan==2.18.0.0 \
		pytesseract==0.1.7 \
		scikit-learn==0.19.0 \
		scipy==1.1.0 \
		Scrapy==1.4.0 \
		seaborn \
		statsmodels==0.8.0 \
		tensorflow==1.10.1 \
		theano==0.9.0 \
		xgboost==0.80 \
               findspark==1.3.0

# Bleeding edge packages from GitHub.
#
RUN pip install \
                git+git://github.com/arviz-devs/arviz.git@1962f62d047af48eb170ff93041701b4614af328

# JupyterHub configuration file.
#
ADD jupyterhub_config.py /srv/jupyterhub/

# Jupyter configuration file.
#
# Location of this file:
#
# - $ jupyter --paths
# - http://jupyter.readthedocs.io/en/latest/projects/jupyter-directories.html.
#
# Global location: /etc/jupyter/
# Local location:  ~/.jupyter/
#
# Custom settings:
#
# - Automatically make copy of notebook as a plain .py script (enables version control) - search for "post_save".
#
ADD jupyter_notebook_config.py /etc/jupyter/

# User accounts.
#
# Default account (insecure; delete this user once everything is running).
#
RUN useradd jupyter -m -p `mkpasswd jupyter` -s /bin/bash
#
# Script to create other accounts.
#
ADD generate-users /usr/local/bin/

# Set up SSL. (Uncomment the three lines below).
#
# ADD privkey.pem /etc/ssl/certs/privkey.pem
# ADD fullchain.pem /etc/ssl/certs/fullchain.pem
# RUN chmod 0600 /etc/ssl/certs/privkey.pem /etc/ssl/certs/fullchain.pem
#
# - Currently using a self-signed certificate, but ultimately should use letsencrypt.
# - In jupyterhub_config.py uncomment c.JupyterHub.ssl_cert and c.JupyterHub.ssl_key.
# - Run with port mapping 443:8000.
#
# With the self-signed certificate you'll have to click on Advanced when you visit the
# site and choose to proceed (despite the dire consequences!). Your browser will indicate
# that the connection is not secure, but this just means that the certificate can't be
# validated. Communication is still happening via HTTPS.
#
# RUN apt-get install openssl
# RUN mkdir /etc/certs/
# RUN openssl req -x509 -nodes -days 730 -newkey rsa:2048 \
#             -subj "/C=US/ST=Washington/L=Seattle/O=Example Corporation/CN=example.com" \
#             -keyout /etc/certs/ssl.key -out /etc/certs/ssl.crt
