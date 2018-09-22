# PySpark Notebook

Based on the [pyspark-notebook](https://hub.docker.com/r/jupyter/pyspark-notebook/) with the following tweaks:

- added JAR to enable interaction with S3;
- added JAR to enable interaction with Kafka;
- install the `kafka` module.

It's possible to include these artifacts on the command line when you submit a Spark job, however, you need to do this for every job. Downloading the artifact repeatedly wastes time and bandwidth. Rather just install them once! Plus the less typing you need to do on the command line, the better.

The repository for the base image is [here](https://github.com/jupyter/docker-stacks).

## PYSPARK_PYTHON Environment Variable

It's important that the version of Python in the driver is the same as on the cluster. We can do this in the driver script as follows:

```
import os

# Tell PySpark to use Python 3 (on master and workers).
#
os.environ['PYSPARK_PYTHON'] = '/usr/bin/python3'
```

But that's a bit of a kludge. It's set in the image instead.

## Image Layout

The Spark distribution is under `/usr/local/`.
