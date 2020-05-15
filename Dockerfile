# http://lifestyletransfer.com/how-to-install-gstreamer-on-ubuntu/

FROM ubuntu:18.04

USER root

RUN apt-get update && apt-get -y --no-install-recommends install \
    sudo \
    vim \
    wget \
    build-essential \
    pkg-config

RUN apt-get -y --no-install-recommends install \
    libgstreamer1.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-doc \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-qt5 \
    gstreamer1.0-pulseaudio \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libcairo2-dev \ 
    libjpeg-dev \
    libgif-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstrtspserver-1.0-dev

# required stuff
RUN apt-get install -y mesa-common-dev

# get source files
RUN cd ~/
RUN wget https://people.freedesktop.org/~cbrill/libtxc_dxtn/libtxc_dxtn-1.0.1.tar.gz --no-check-certificate 
RUN tar xvfz libtxc_dxtn-1.0.1.tar.gz
RUN cd libtxc_dxtn-1.0.1 \

# start the job
    ./configure \
    make \
    make install \

# clean up sources (optional)
    cd .. \
    -rf libtxc_dxtn-1.0.1 libtxc_dxtn-1.0.1.tar.gz

# https://community.nxp.com/thread/525440 
ENV XDG_RUNTIME_DIR=/run/user/0/     
    
# https://askubuntu.com/questions/834254/steam-libgl-error-no-matching-fbconfigs-or-visuals-found-libgl-error-failed-t

RUN rm -f /usr/lib/x86_64-linux-gnu/libGL.so \
    rm -f /usr/lib/x86_64-linux-gnu/libGL.so.1

# gst-launch-1.0 videotestsrc ! autovideosink OK!!
# gst-launch-1.0 -v playbin uri=rtsp://user:password@ip/h.264 OK!!

# http://alax.info/blog/343 Interactive RTSP Client

# https://stackoverflow.com/questions/3298934/how-do-i-view-gstreamer-debug-output DEBUG LEVELS

# export GST_DEBUG="*:6"
