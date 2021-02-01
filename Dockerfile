FROM ubuntu:latest
RUN  export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install automake ca-certificates g++ git libtool libleptonica-dev make pkg-config  
RUN apt-get -y install --no-install-recommends asciidoc docbook-xsl xsltproc 
RUN apt-get -y install libicu-dev libpango1.0-dev libcairo2-dev

COPY tess/ /tess/
COPY tess.conf /etc/ld.so.conf.d/tess.conf
RUN /sbin/ldconfig

ENV TESSDATA_PREFIX /tess/share/tessdata
COPY scripts/ /home/scripts
ENV SCRIPTS_DIR /home/scripts
RUN ${SCRIPTS_DIR}/tessdata_download.sh


ENV PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tess/bin

WORKDIR /home
ENTRYPOINT [ "/tess/bin/tesseract" ]