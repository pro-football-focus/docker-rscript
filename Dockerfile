FROM ubuntu:18.04
MAINTAINER Geoff Lane <geoff.lane@profootballfocus.com>

ENV REFRESH 20200109
# Make sure interactive install elements are hidden
ENV DEBIAN_FRONTEND noninteractive

# Install random dependencies
# libssh needed for gitr
RUN apt-get -y update \
   && apt-get install -y  \
    build-essential \
    software-properties-common \
    curl \
    libxml2-dev \
    ca-certificates \
    libssl-dev \
    libssh2-1-dev \
    libssh2-1 \
    libgit2-26 \
    libgit2-dev \
    libcurl4-gnutls-dev \
    openssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R 3.6, even though below says 3.5... right
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
      && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
      && apt-get update \
      && apt-get install -y \
      r-base \
      r-base-core \
      r-recommended \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN R -e "install.packages(c('devtools', 'git2r', 'usethis'), repos='https://cloud.r-project.org', clean=TRUE)"
