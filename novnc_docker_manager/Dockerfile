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
	iptables \
    libapt-pkg-perl \
    libdap-dev \
    libfftw3-bin \
    libfftw3-dev \
    libfreetype6-dev \
    libgnutls28-dev \
    make \
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
	software-properties-common \
    spyder3 \
    sqlite3 \
    subversion \
	uidmap \
    unixodbc-dev \
    unzip \
    vim \
    virtualenv \
    wget \
    xterm  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo LANG="en_US.UTF-8" > /etc/default/locale

# RUN apt-get purge docker-ce docker-ce-cli containerd.io
# RUN rm -rf /var/lib/docker &> /dev/null

# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# RUN add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# RUN apt-get update && \
#     apt-get install docker-ce docker-ce-cli containerd.io

RUN pip3 install --upgrade pip

# RUN systemctl enable snapd.service && \
#     systemctl start snapd.service

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

WORKDIR /tmp

RUN curl -LO https://github.com/UNINETT/kubed/releases/download/0.2.0/kubed-linux-amd64 && \
    mv kubed-linux-amd64 /usr/local/bin/kubed && \
    chmod +x /usr/local/bin/kubed

RUN pip3 install \
    requests \
    urllib3



# Reduce the image size
RUN apt-get autoremove -y
RUN apt-get clean -y

USER 1000

WORKDIR /mnt

#RUN curl -fsSL https://get.docker.com/rootless | sh