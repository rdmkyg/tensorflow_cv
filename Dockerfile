#Dockerfile 
FROM  tensorflow/tensorflow:2.4.3-jupyter
MAINTAINER  yonggyu.kim <rdmkyg.gmail.com>  


#openCV is available for installation from the default Ubuntu 20.04 repositories
ARG DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Seoul
RUN  apt-get update && \
       apt-get upgrade -y && \
       apt-get install -y \
            libopencv-dev \
            python3-opencv 

#Install the build tools and dependencies:
RUN apt install  -y \
      build-essential cmake git pkg-config libgtk-3-dev \
     libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
     libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev python3-numpy \
    libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

#lone the OpenCV’s and OpenCV contrib repositories:
RUN mkdir ~/opencv_build 
WORKDIR /root/opencv_build/
RUN git clone https://github.com/opencv/opencv.git
RUN git clone https://github.com/opencv/opencv_contrib.git

#Once the download is complete, create a temporary build directory
WORKDIR /root/opencv_build/opencv
RUN mkdir -p build 
WORKDIR /root/opencv_build/opencv/build

# Set up the OpenCV build with CMake:
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..

#Start the compilation process
RUN make -j8

#Install OpenCV with:
RUN  make install

# C++ bindings:
RUN pkg-config --modversion opencv4


