#! /bin/bash
docker run --name esp32 --rm -ti --device /dev/ttyUSB0:/dev/ttyUSB0 -v `pwd`:/opt/esp/projects esp-env:v1 /bin/bash