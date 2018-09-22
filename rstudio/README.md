# RStudio Docker Image

Basic RStudio image with some packages that I find indispensible.

## Setup

You'll need to be able to access the host system on the following ports:

- 22 (SSH)
- 8787 (RStudio Server)
- 3838 (Shiny Server)

## Build and Run

Create a `rstudio` folder in your home directory on the host. This is very important!

```
mkdir ~/rstudio
```

```
docker build -t rstudio .
docker run -d --rm --name rstudio -p 8787:8787 -v ~/rstudio:/home/rstudio rstudio
```

## Creating Users

This assumes that you have given the running RStudio container a name of `rstudio`.

Suppose that you want to create 10 users on the container.

```
./users-generate-details.sh 10 | tee user-accounts.csv | ./users-create-accounts.sh rstudio
```

This will save the usernames and passwords into a file called `user-accounts.csv`.

## Other Refinements

Launching the container with the default authentication credentials is not ideal. You can leave the username `rstudio` but at least set a more secure password.

```
docker run -d --rm --name rstudio -p 8787:8787 -v ~/rstudio:/home/rstudio -e PASSWORD=<new-password> rstudio
```

You can also change the user name with `-e USER=`.

Include a Shiny server.

```
docker run -d --rm --name rstudio -p 3838:3838 -p 8787:8787 -v ~/rstudio:/home/rstudio rstudio
```

## Note on Mounting Volumes

If you are going to mount a volume then it's important that the container is able to write to the folder on the host. To this end it might be useful to set the UID for the container to be the same as that of the UID of the owner of the folder on the host. You can do this with the `-e USERID=` option.

For example:

```
docker run -d --rm --name rstudio -p 8787:8787 -e USERID=500 -v ~/rstudio:/home/rstudio rstudio
```
