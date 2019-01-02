FROM ubuntu:18.04

LABEL maintainer="Hanhandelaoba <wangkai@qiandy.net>" Description="Image for building esp32 projects"
RUN mkdir -p /opt/esp/projects \
    && apt-get update \    
    && apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-pyparsing \
    && apt-get clean
WORKDIR /opt/esp
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    && tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    && rm -f xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    && git clone -b v3.1.1 --recursive https://github.com/espressif/esp-idf.git \
    && git clone --recursive https://github.com/espressif/esp-mdf.git

ENV PATH="$PATH:/opt/esp/xtensa-esp32-elf/bin"     
ENV IDF_PATH=/opt/esp/esp-idf MDF_PATH=/opt/esp/esp-mdf 

RUN python2.7 -m pip install --user -r $IDF_PATH/requirements.txt

VOLUME /opt/esp/projects
WORKDIR /opt/esp/projects

