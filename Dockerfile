FROM ubuntu:20.04

ENV ANT_VERSION=1.10.11
ENV SAXON_VERSION=Saxon-HE/10/Java/SaxonHE10-6J

USER root


# install jre8, unzip
RUN apt-get update && apt-get install -y \
    openjdk-8-jre-headless \
    unzip && \
    apt-get clean

# setup ant
ADD https://downloads.apache.org/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz /tmp/ant.tar.gz
RUN tar -xvf /tmp/ant.tar.gz -C /opt
ENV ANT_HOME=/opt/apache-ant-${ANT_VERSION}
ENV PATH=${PATH}:${ANT_HOME}/bin

# setup saxon
ADD https://sourceforge.net/projects/saxon/files/${SAXON_VERSION}.zip/download /tmp/saxon.zip
RUN unzip /tmp/saxon.zip -d ${ANT_HOME}/lib

#setup xerces
ADD https://www.oxygenxml.com/maven/com/oxygenxml/oxygen-patched-xerces/23.1.0.0/oxygen-patched-xerces-23.1.0.0.jar ${ANT_HOME}
