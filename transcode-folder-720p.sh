#!/bin/bash
#transcode-folder-480p.sh
#usage transcode-folder-480p in-folder/ out-folder/

in_folder=$1
out_folder=$2

for file in $in_folder/*
do
  if [ -f "${file}" ]
  then
    filename=$(basename $file)
    echo trancodeing $filename to $out_folder/$filename-720p-trancode.mp4
    ffmpeg -i $file -s 1280x720 -c:v libx264 -c:a aac -crf 21 -preset slow $out_folder/$filename-720p-transcode.mp4
  fi
done