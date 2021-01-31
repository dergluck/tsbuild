FROM ubuntu:latest

COPY tess/ /tess/
COPY scripts/ /home/scripts

ENV SCRIPTS_DIR /home/scripts
RUN ${SCRIPTS_DIR}/tessdata_download.sh

ENV TESSDATA_PREFIX /tess/share/tessdata
ENV LD_LIBRARY_PATH=/tess/lib
ENV PATH=/bin:/usr/bin:/tess/bin
CMD ldconfig

WORKDIR /home
ENTRYPOINT [ "/tess/bin/tesseract" ]