#!/bin/bash
#transcode-folder-1080p.sh
#usage transcode-folder-1080p in-folder/ out-folder/

in_folder=$1
out_folder=$2

for file in $in_folder/*
do
  if [ -f "${file}" ]
  then
    filename=$(basename $file)
    echo trancodeing $filename to $out_folder/$filename-1080p-trancode.mp4
    ffmpeg -i $file -s 1920x1080 -c:v libx264 -c:a aac -crf 21 -preset slow $out_folder/$filename-1080p-transcode.mp4
  fi
done