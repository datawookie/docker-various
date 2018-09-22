To build:

```
$ docker build -t osrm:latest .
```

To run:

```
$ docker run -p 5000:5000 -v `pwd`:/data osrm:latest map.xml
```

## Other Implementations

- <https://hub.docker.com/r/osrm/osrm-backend/>
- <https://github.com/Project-OSRM/osrm-backend-docker>
- <https://github.com/irony/osrm>
- <https://github.com/acroca/osrm-docker>
- <https://github.com/cartography/osrm-backend-docker>
