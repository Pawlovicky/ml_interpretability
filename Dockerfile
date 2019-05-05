FROM ubuntu:16.04
MAINTAINER Pawlovicky <Pavel@Pawlovicky.com>

# Install git, wget, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  iproute2 \
  wget \
  python3.5 \
  python3-pip \
  python3-dev 
  
# Install tensorflow and basics
# ENV TF_PYTHON_URL https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl
# RUN pip3 install $TF_PYTHON_URL \

RUN pip3 install tensorflow \
    jupyter \
    pandas \
    scikit-learn \
    matplotlib \
    scikit-image \
    pillow \
    tqdm \
    seaborn
# Install libraries for web scraping
RUN pip3 install BeautifulSoup4 \
    requests \
    demjson

# Install Keras and its dependencies
RUN pip3 install h5py \
    keras

# Packages necessary for mailgun API
RUN pip3 install httplib2 \
    webapp2 \
    openpyxl \
    xlwt \
    lxml

RUN pip3 install statsmodels

#RUN useradd docker -u 1000 -s /bin/bash -m
#USER docker

# Set working directory
WORKDIR /work

ENTRYPOINT ["/bin/bash"]

