FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive


RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update && apt-get install -y git pkg-config libopencv-dev
RUN cd /root && git clone https://github.com/AlexeyAB/darknet.git && cd darknet && sed -i 's/GPU=0/GPU=1/; s/CUDNN=0/CUDNN=1/; s/OPENCV=0/OPENCV=1/' Makefile && make

COPY yolov4.weights /root/darknet/

WORKDIR /root/darknet