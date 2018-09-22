# =============================================================================
# RSTUDIO DOCKER IMAGE
# =============================================================================
#
# To build:
#
# $ docker build -t rstudio:latest .
#
# To force a rebuild:
#
# $ docker build --no-cache -t rstudio:latest .
#
# To run:
#
# $ docker run -d -p 80:8787 --name rstudio rstudio:latest
#
# -----------------------------------------------------------------------------
#
FROM rocker/verse:3.5.0
MAINTAINER Andrew Collier <andrew@exegetic.biz>
#
# Install system software.
#
# xvfb - for R packages which require X11 to install
#
RUN apt-get update && \
    apt-get install -y -qq \
        whois \
        apg \
	default-jre default-jdk \
        ggobi \
        libatlas3-base \
	libbz2-dev \
        libcurl4-openssl-dev \
        libgdal-dev \
        libgeos-dev \
        libglu1-mesa-dev \
        libgtk2.0-dev \
        libnlopt-dev \
        libtcl8.6 libtk8.6 \
	liblzma-dev \
        lsb-release \
	python-pip \
        mesa-common-dev \
        unixodbc-dev \
        xvfb && \
    apt-get clean -y

# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
#    texlive \ 
#    texlive-base \ 
#    texlive-latex-extra \ 
#    texlive-pstricks \ 
#    pandoc

RUN R CMD javareconf

# RUN pip install kaggle-cli

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#
# This currently doesn't work because there isn't a separate repository for "stretch".
#
# RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu/ $(lsb_release -sc)/" >>/etc/apt/sources.list
# RUN echo "deb http://cloud.r-project.org/bin/linux/debian jessie-cran34/" >>/etc/apt/sources.list

# Consolidate locations used to install R packages from Ubuntu repository.
#
# RUN ln -s /usr/local/lib/R/ /usr/lib/R

# Select a CRAN mirror.
#
# RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com"))' >>/etc/R/Rprofile.site

# Install R packages.
#
# The base image has packages from http://tidyverse.org/.
#
RUN install2.r --error --deps TRUE -- --no-test-load \
    RUnit \
    rJava \
    XML
#
# - Packages not available on CRAN.
#
RUN install2.r --error --deps TRUE \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    graph \
    RBGL \
    pkgDepTools \
    Rgraphviz

# - Packages on CRAN (and that rely on X11).
#
# RUN xvfb-run install2.r --error -- --no-test-load \
#   rattle

# - Packages on CRAN.
#
# These are actually installed from MRAN (https://mran.microsoft.com/). You can specify a particular
# CRAN repository instead by using the -r flag. For example, -r 'http://cran.rstudio.com'.
#
RUN install2.r --error -- --no-test-load --data-compress=bzip2 --no-html \
    adabag \
    caret \
    corrgram \
    DiagrammeR \
    DMwR \
    doMC \
    e1071 \
    ElemStatLearn \
    Epi \
    fastAdaboost \
    gbm \
    ggmap \
    glmnet \
    gmapsdistance \
    ipred \
    ISLR \
    knitr \
    mailR \
    Metrics \
    mice \
    mlbench \
    neuralnet \
    odbc \
    osrm \
    outliers \
    party \
    partykit \
    randomForest \
    raster \
    rattle \
    reticulate \
    rgdal \
    rgeos \
    rpart.plot \
    Rlof \
    ROCR \
    rpart \
    semver \
    sparklyr \
    vcdExtra \
    VIM \
    xgboost

# Some packages that have cool data.
#
RUN install2.r --error -- --no-test-load --data-compress=bzip2 --no-html \
    nycflights13 \
    Lahman

#
# - Packages on GitHub.
#
RUN R -e 'devtools::install_github("DataWookie/exegetic")'
RUN R -e 'devtools::install_github(c("johndharrison/binman", "johndharrison/wdman"))'
RUN R -e 'devtools::install_github("ropensci/RSelenium@v1.7.1")'
#
# Add script to generate new user accounts.
#
# ADD https://raw.githubusercontent.com/DataWookie/docker-exegetic/master/users-create-accounts.sh /usr/sbin
# RUN chmod 700 /usr/sbin/users-create-accounts.sh

# COPY user-password.txt user-password.txt
# RUN for user in `awk -F: '{print $1}' user-password.txt`; do useradd -m $user -s /bin/bash; done && \
#     cat user-password.txt | chpasswd

# Clean up.
#
RUN apt-get remove -y -qq \
    xvfb

# Enable Shiny server on port 3838.
#
RUN export ADD=shiny && bash /etc/cont-init.d/add

