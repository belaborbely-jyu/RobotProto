﻿FROM mcr.microsoft.com/playwright:focal
USER root
RUN apt-get update
RUN apt-get install -y python3-pip
USER pwuser
RUN pip3 install --user robotframework
RUN pip3 install --user robotframework-browser
RUN ~/.local/bin/rfbrowser init
RUN pip3 install --user  robotframework-jsonlibrary
ENV NODE_PATH=/usr/lib/node_modules
ENV PATH="/home/pwuser/.local/bin:${PATH}"