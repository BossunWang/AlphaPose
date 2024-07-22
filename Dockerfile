FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

MAINTAINER Bossun Wang <vvmodouco@gmail.com>

USER root

ADD Alphapose/ /workspace/Alphapose

RUN <<__EOF__
apt-get update
apt-get upgrade -y
apt-get install git -y
__EOF__

ENV PATH="/usr/local/cuda/bin/:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64/:${LD_LIBRARY_PATH}"
WORKDIR /workspace

RUN ssh-keyscan github.com >> /etc/ssh/ssh_known_hosts
RUN pip install cython==0.27.3
RUN pip install ninja
RUN pip install easydict halpecocotools munkres natsort opencv-python pyyaml scipy tensorboardx  terminaltables timm==0.1.20 tqdm visdom jinja2 typeguard
RUN apt-get install libyaml-dev -y
RUN pip install pycocotools
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN conda install -c fvcore -c iopath -c conda-forge fvcore iopath
RUN conda install -c bottler nvidiacub
RUN pip install git+https://git@github.com/facebookresearch/pytorch3d.git@stable

