#!/bin/bash

apt-get update
apt-get -y install wget
# osd	Orientation and script detection
wget -O "${TESSDATA_PREFIX}/osd.traineddata" https://github.com/tesseract-ocr/tessdata_best/raw/master/osd.traineddata
# equ	Math / equation detection
wget -O "${TESSDATA_PREFIX}/equ.traineddata" https://github.com/tesseract-ocr/tessdata/raw/3.04.00/equ.traineddata
# eng English
wget -O "${TESSDATA_PREFIX}/eng.traineddata" https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata
# other languages: https://github.com/tesseract-ocr/tesseract/wiki/Data-Files
# rus Russian
wget -O "${TESSDATA_PREFIX}/rus.traineddata" https://github.com/tesseract-ocr/tessdata_best/raw/master/rus.traineddata