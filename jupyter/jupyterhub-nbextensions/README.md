# jupyterhub-nbextensions-docker
For automated docker build of a jupyterhub container with notebook extensions installed

Instructions are for Mac users. May be different using other operating systems.

Pull with
`docker pull colinsvds/jupyterhub-nbextensions-docker`
If you want to mount a volume or do anything else with the filesystem (like install extra packages) other than just run jupyterhub, run it with:

`docker run -it -p 8000:8000 colinsvds/jupyterhub-nbextensions-docker bash`

If you just want to run the jupyterhub server in the background, run:

`docker run -d -p 8000:8000 colinsvds/jupyterhub-nbextensions-docker`

then open a browser on your machine and navigate to:

`<your docker-machine ip>:8000`

(to find your docker-machine ip, type `docker-machine ip` into a Docker quickstart terminal)

If you want to save any notebooks or other files you work on in jupyterhub, make sure to mount a volume to the container:

`docker run -d -p 8000:8000 -v /absolute/path/to/directory:/home/colin/host_volume colinsvds/jupyterhub-nbextensions-docker`
(general use `-v /host/directory:/container/directory`)

If you don't mount a volume and for any reason stop your container, your work can be lost.
