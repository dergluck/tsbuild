FROM ubuntu:latest

COPY tess/ /tess/
COPY scripts/ /home/scripts

ENV SCRIPTS_DIR /home/scripts
RUN ${SCRIPTS_DIR}/tessdata_download.sh

ENV TESSDATA_PREFIX /tess/share/tessdata
ENV PATH=/bin:/usr/bin:/tess/bin
COPY tess.conf /etc/ld.so.conf.d/tess.conf

WORKDIR /home
ENTRYPOINT [ "/tess/bin/tesseract" ]