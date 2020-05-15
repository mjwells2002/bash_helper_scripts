#!/bin/bash
#remote-transcode-folder-720p.sh
#usage remote-transcode-folder-720p in-folder/ out-folder/
#requires $remote_transcode_server host enviroment varible set and ssh keys configured
#requires $remote_transcode_server_user enviroment varible set
#requires $remote_transcode_server has ffmpeg installed 
#requires ability to scp files to $remote_temp_path envienviroment varibleroment varible

in_folder=$1
out_folder=$2
#requires trailing / please dont use tmpfs or ramdisk
remote_temp_path='/ondisk_tmp/'
folder_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

remotessh="ssh $remote_transcode_server_user@$remote_transcode_server"
remote_host_string="$remote_transcode_server_user@$remote_transcode_server"

remote_tmp_folder="$remote_temp_path$folder_name/"

for file in $in_folder/*
do
  if [ -f "${file}" ]
  then
    filename=$(basename $file)
    echo trancodeing $filename to $out_folder/$filename-720p-trancode.mp4
    
    $remotessh -C mkdir -p $remote_tmp_folder
    scp $file $remote_host_string:$remote_tmp_folder$filename
    $remotessh -C ffmpeg -i $remote_tmp_folder$filename -s 1280x720 -c:v libx264 -c:a aac -crf 21 -preset slow $remote_tmp_folder$filename-720p-transcode.mp4
    scp $remote_host_string:$remote_tmp_folder$filename-720p-transcode.mp4 $out_folder/
    $remotessh -C rm $remote_tmp_folder$filename
    $remotessh -C rm $remote_tmp_folder$filename-720p-transcode.mp4
    $remotessh -C rm -rf $remote_tmp_folder
    
  fi
done