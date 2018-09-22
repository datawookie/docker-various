FROM rocker/verse:3.5.0
MAINTAINER Andrew Collier <andrew@exegetic.biz>

ENV SPARK_VERSION 2.3.0
ENV SPARKLYR_VERSION 0.8.4

RUN R -e 'devtools::install_version("sparklyr", version = Sys.getenv("SPARKLYR_VERSION"))'
RUN R -e 'sparklyr::spark_install(version = Sys.getenv("SPARK_VERSION"), verbose = TRUE)'

RUN mv /root/spark /opt/ && \
    chown -R rstudio:rstudio /opt/spark/ && \
    ln -s /opt/spark/ /home/rstudio/

RUN install2.r --error -- --no-test-load --data-compress=bzip2 --no-html \
    gutenbergr \
    nycflights13 \
    reticulate

RUN cd /opt/spark/spark-${SPARK_VERSION}-*/jars/ && \
    wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar && \
    wget http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar && \
    wget http://central.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-8-assembly_2.11/2.3.1/spark-streaming-kafka-0-8-assembly_2.11-2.3.1.jar

