# Overview

This repository contains the details of making an esp-open-rtos docker image
for building esp-open-rtos projects.
The aim is to use this container within vscode to develop ESP8266 projects.

Using a container holding all the build tools ensures that I do not pollute my
macOS system with multiple build tool chains that need to be managed, updated,
cleaned up when I loose interest in a particular set of tools etc.
With everything in a container. All I need to do when I no longer want to use
it is delete the container and my macOS install has no shrapnel left lying around.

## Building an esp-open-rtos project

Using the resultant esp-rtos container you can build a esp-open-rtos project
using the following command:

```shell
# docker run -it --rm -v `pwd`:/project -w /project esp-rtos make -C `pwd`
```

*more details to follow*
