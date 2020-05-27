# The image to use as a base image
FROM quay.io/uninett/desktop-vnc:20200518-9fef810

LABEL authors="Stefan Blumentrath"
LABEL maintainer="stefan.blumentrath@nina.no"

# Install system packages
USER root

WORKDIR /tmp

# Workaround for resolveconf ubuntu docker issue
# https://stackoverflow.com/questions/40877643/apt-get-install-in-ubuntu-16-04-docker-image-etc-resolv-conf-device-or-reso
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install software-properties-common apt-utils python3-pip -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    apt-transport-https \
	attr \
    bc \
    bison \
    build-essential \
    bzip2 \
	ca-certificates \
    curl \
    cython \
    cython3 \
    default-jdk \
    flex \
    g++ \
    gcc \
    geany \
    gettext \
    git \
    gnutls-bin \
	gnupg-agent \
    libapt-pkg-perl \
    libdap-dev \
    libfftw3-bin \
    libfftw3-dev \
    libfreetype6-dev \
    libgnutls28-dev \
    make \
    maven \
    mc \
    moreutils \
    p7zip-full \
    pycodestyle \
    pyflakes \
    pylint \
    python-autopep8 \
    python3-dateutil \
    python3-dev \
    python3-extras \
    python3-httplib2 \
    python3-jinja2 \
    python3-libxml2 \
    python3-pep8 \
    python3-pillow \
    python3-pil \
    python3-setuptools \
    python3-sip \
    python3-six \
	snapd \
	software-proporties-common \
    spyder3 \
    sqlite3 \
    subversion \
    unixodbc-dev \
    unzip \
    vim \
    virtualenv \
    wget \
    xterm  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo LANG="en_US.UTF-8" > /etc/default/locale

RUN apt-get purge docker-ce docker-ce-cli containerd.io
RUN rm -rf /var/lib/docker &> /dev/null

RUN pip3 install --upgrade pip

RUN snap install helm3
RUN snap install kubectl --classic

RUN pip3 install \
    requests \
    urllib3



# Reduce the image size
RUN apt-get autoremove -y
RUN apt-get clean -y

USER 1000
