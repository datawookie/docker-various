# OpenBoard

[OpenBoard](http://openboard.ch/index.en.html) is an interactive whiteboard.

## Build and Run

```
docker build -t openboard .
```

```
docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix openboard
```

It might be necessary to run this first in order to give Docker rights to X11:

```
xhost +local:docker
```
