# Jupyter Notebook

A Jupyter Notebook image with a few bells and whistles. It includes the following kernels:

- Python 3
- Julia

## Build & Launch

To build:

```
$ docker build -t jupyterhub:latest .
```

To force a rebuild:

```
$ docker build --no-cache -t jupyterhub:latest .
```

To run:

```
$ docker run -d -p 80:8000 jupyterhub:latest
```

```
$ docker run --rm --name jupyter -v $PWD:/home/jupyter -d -p 80:8000 jupyterhub:latest
```

The default login credentials are `jupyter` for both Username and Password.

## Multiple Users

1. Create a volume to persist the users' files.

```
$ docker volume create jupyter-users
$ docker volume ls
$ docker volume inspect jupyter-users
```

2. Run the image and mount the volume.

```
$ docker run --rm --name jupyter -v jupyter-users:/home/ -d -p 80:8000 jupyterhub:latest
```

3. Launch a `bash` shell in the container and run the `generate-users` script.

```
# generate-users 5
```

4. Access the files created by users' in the folder listed by `docker volume inspect`. Copy this content elsewhere for posterity!

5. When you are done you can remove the volume.

```
$ docker volume rm jupyter-users
```

## Details

Currently the Julia kernel does not work. I think that this is because it's
installing Julia 0.3 and Jupyter requires Julia 0.4.

Also note that the procedure below will install the Julia kernel in the
root user's home folder (~/.local/share/jupyter/kernels/). To make the Julia
kernel available to all users we will probably need to get it installed to
/usr/share/jupyter/kernels.

Take a look at the Spark images to see how this can be done better?

To help with Julia:

- https://hub.docker.com/r/gnimuc/jupyterhub-docker-images/~/dockerfile/
- https://github.com/felipenoris/math-server-docker/blob/master/Dockerfile

## HTTPS

Ideally you should server JupyterHub over a secure (HTTPS) protocol.

Here's what you need to do:

1. Create a CNAME record in DNS which maps from your registered (sub-)domain
   to the host machine.

2. Generate SSL certificates (https://letsencrypt.org/). You'll need to have
   these PEM files available:

     fullchain.pem - SSL certificate
     privkey.pem   - SSL key

3. Uncomment the lines at the end of Dockerfile which copy the PEM files onto
   the image.

4. In jupyterhub_config.py uncomment the following lines:

     c.JupyterHub.hub_port
     c.JupyterHub.port
     c.JupyterHub.ssl_cert
     c.JupyterHub.ssl_key

5. Build the image.

6. Launch a container using -p 443:443.

7. Make sure that the host accepts connections on port 443.

8. Point your browser to the host.

You might need to actually specify 'https://' in your browser so that it looks for port 443.

http://jupyter-notebook.readthedocs.io/en/latest/public_server.html
https://github.com/jupyterhub/jupyterhub-deploy-docker
https://github.com/jupyterhub/jupyterhub/wiki/Installation-of-Jupyterhub-on-remote-server
http://jupyterhub.readthedocs.io/en/latest/config-examples.html

Try using the VOLUME directive in Dockerfile.

Ideas for improvement:

- <https://zero-to-jupyterhub.readthedocs.io/en/latest/>
- <https://zonca.github.io/2016/04/jupyterhub-sdsc-cloud.html>
- <http://jupyterhub.readthedocs.io/en/latest/quickstart.html>
- <https://jupyterhub.readthedocs.io/en/latest/getting-started.html>
- <https://sites.google.com/site/jupyterhubconfiguration/>
- <https://github.com/jupyterhub/jupyterhub/wiki/Deploying-JupyterHub-on-AWS>

