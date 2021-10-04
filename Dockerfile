FROM ubuntu:20.04

ENV ANT_VERSION=1.10.11

USER root

ADD https://downloads.apache.org/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz /tmp/ant.tar.gz

# install jre8, unzip
RUN apt-get update && apt-get install -y \
    openjdk-8-jre-headless \
    unzip && \
    apt-get clean

# setup ant
RUN tar -xvf /tmp/ant.tar.gz -C /opt
ENV ANT_HOME=/opt/apache-ant-${ANT_VERSION}
ENV PATH=${PATH}:${ANT_HOME}/bin
