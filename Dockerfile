FROM ubuntu:latest

COPY tess/ /tess/
COPY scripts/ /home/scripts

ENV SCRIPTS_DIR /home/scripts
RUN ${SCRIPTS_DIR}/tessdata_download.sh

ENV TESSDATA_PREFIX /tess/share/tessdata

WORKDIR /home