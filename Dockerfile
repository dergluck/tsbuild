FROM ubuntu:latest
CMD  export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade \
    && apt-get -y install automake ca-certificates g++ git libtool libleptonica-dev make pkg-config  \
    &&  apt-get -y install --no-install-recommends asciidoc docbook-xsl xsltproc \
    && apt-get -y install libicu-dev libpango1.0-dev libcairo2-dev

COPY tess/ /tess/
COPY scripts/ /home/scripts

ENV SCRIPTS_DIR /home/scripts
RUN ${SCRIPTS_DIR}/tessdata_download.sh

ENV TESSDATA_PREFIX /tess/share/tessdata
ENV PATH=/bin:/usr/bin:/tess/bin
COPY tess.conf /etc/ld.so.conf.d/tess.conf
WORKDIR /home
ENTRYPOINT [ "/tess/bin/tesseract" ]