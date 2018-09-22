FROM jupyter/pyspark-notebook:8ccdfc1da8d5
MAINTAINER Andrew Collier <andrew@exegetic.biz>

USER root

RUN wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar && \
    wget http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar && \
    wget http://central.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-8-assembly_2.11/2.3.1/spark-streaming-kafka-0-8-assembly_2.11-2.3.1.jar && \
    mv *.jar /usr/local/spark/jars

RUN pip install --no-cache-dir \
    kafka \
    findspark

# Assuming that Python 3 is installed at /usr/bin/python3 on the cluster.
#
ENV PYSPARK_PYTHON /usr/bin/python3
#
# Make link to same location in container.
#
RUN ln -s /opt/conda/bin/python3 /usr/bin/python3

USER $NB_UID
