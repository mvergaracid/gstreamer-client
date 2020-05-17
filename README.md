## Gstreamer client

This project make a docker image with all dependencies to run gstreamer fixings some troubles to run the thing.

## Build the image

docker build -t gstreamer-client:latest .

## Run the container

docker run -it --rm -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix/:/tmp/.X11-unix gstreamer:latest bash

## Run client

gst-launch-1.0 videotestsrc ! autovideosink

gst-launch-1.0 -v playbin uri=rtsp://user:name@ip/some




