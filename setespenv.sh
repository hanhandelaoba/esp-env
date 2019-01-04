#! /bin/bash
if [ "$1" = "d" ]
then
	docker run --name esp32 --rm -ti --device /dev/ttyUSB0:/dev/ttyUSB0 -v `pwd`:/opt/esp/projects esp-env:v1.3 /bin/bash
else
	docker run --name esp32 --rm -ti -v `pwd`:/opt/esp/projects esp-env:v1.3 /bin/bash
fi

