FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

# install necessary package
RUN apt-get update && apt-get install -y \
    build-essential g++ graphviz libopenblas-dev liblapacke-dev \
    python3 python3-dev python3-pip python3-tk python3-lxml \
    python3-six python3-setuptools cmake git \
    vim emacs rsync software-properties-common \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN python3 -m pip install -U pip && \
    pip3 install --no-cache-dir pillow numpy scipy matplotlib graphviz pydot h5py \
    scikit-image sklearn pandas networkx tensorflow-gpu \
 && pip3 install --upgrade git+git://github.com/fchollet/keras.git
