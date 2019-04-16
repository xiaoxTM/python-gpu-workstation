FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
ENV DEBIAN_FRONTEND noninteractive
LABEL maintainer "Renwu Gao <gilyou.public@gmail.com>"

# install necessary package
RUN apt-get update && apt-get install -y \
    build-essential g++ graphviz libopenblas-dev liblapacke-dev \
    python3 python3-dev python3-pip python3-tk python3-lxml python3-six python3-setuptools \
    python automake autoconf libtool cmake git \
    vim emacs rsync software-properties-common \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
RUN python3 -m pip install -U pip && \
    pip3 install -U --no-cache-dir numpy scipy matplotlib graphviz pydot h5py \
    scikit-image sklearn pandas networkx tensorflow-gpu mxnet-cu100 \
 && pip3 install --upgrade git+git://github.com/fchollet/keras.git \
 && pip3 install https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl \
 && pip3 install torchvision
