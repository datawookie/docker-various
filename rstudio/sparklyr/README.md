# RStudio Server with Spark & sparklyr

This image is available as [datawookie/rstudio-sparklyr](https://hub.docker.com/r/datawookie/rstudio-sparklyr/).

It has the following installed:

- the `sparklyr` library;
- a Spark distribution; and
- a few handy JARs to handle working with S3 and Kafka.

## Build and Run

```
docker build -t rstudio-sparklyr .
docker run -d --rm --name rstudio -p 8787:8787 -v ~:/home/rstudio rstudio-sparklyr
```

## To Do

If you mount a volume then sparklyr no longer sees that version of Spark that was downloaded in the Dockerfile. A couple of options for getting around this:

1. download to a different location (in root of file system) and
2. point sparklyr to this other location by default?

Alternatively, if mounted volume then just set `SPARK_HOME` to location of Spark before loading sparklyr.

```
Sys.setenv(SPARK_HOME = "/opt/spark/spark-2.3.0-bin-hadoop2.7/")
```
