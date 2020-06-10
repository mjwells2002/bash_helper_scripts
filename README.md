# bash_helper_scripts

a small colection of scripts i use on my laptop in order to make tasks i do often eaiser

All scripts have been tested on
```
$ uname -r
5.6.11-arch1-1
```

## rdocker.sh

remote docker
uses the $remote_docker_host varible to run just 1 docker command on the remote docker host

example:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
$ rdocker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                   NAMES
4f8cfa2fd3a8        nginxdemos/hello    "nginx -g 'daemon of…"   36 seconds ago      Up 27 seconds       0.0.0.0:32769->80/tcp   relaxed_benz
```

## rdocker-compose.sh

remote docker-compose
uses the $remote_docker_host varible to run just 1 docker-compose command on the remote docker host

example:
```
$ rdocker-compose up -d
Creating network "test_default" with the default driver
Creating test_nginx-demo-test_1 ... done
$
```

## transcode-folder-480p.sh

batch transcode a folder of videos to 480p h264 using the libx264 encoder on slow preset at crf 21 using ffmpeg
example:
```
$ transcode-folder-480p ~/Videos ~/Transcoded-video
transcoding /home/user/Videos/BigBuckBunny.mp4 to /home/user/Transcoded-video/BigBuckBunny.mp4-480p-transcode.mp4
ffmpeg version ...
```

## transcode-folder-720p.sh

batch transcode a folder of videos to 720p h264 using the libx264 encoder on slow preset at crf 21 using ffmpeg
example:
```
$ transcode-folder-720p ~/Videos ~/Transcoded-video
transcoding /home/user/Videos/BigBuckBunny.mp4 to /home/user/Transcoded-video/BigBuckBunny.mp4-720p-transcode.mp4
ffmpeg version ...ffmpeg version n4.2.2 Copyright (c) 2000-2019 the FFmpeg developers
```
## transcode-folder-1080p.sh

batch transcode a folder of videos to 1080p h264 using the libx264 encoder on slow preset at crf 21 using ffmpeg
example:
```
$ transcode-folder-1080p ~/Videos ~/Transcoded-video
transcoding /home/user/Videos/BigBuckBunny.mp4 to /home/user/Transcoded-video/BigBuckBunny.mp4-1080p-transcode.mp4
ffmpeg version ...
```

## remote-transcode-folder-480p.sh

same as transcode-folder-480p but it uses a remote ssh server to transcode the video

## remote-transcode-folder-720p.sh

same as transcode-folder-720p but it uses a remote ssh server to transcode the video

## remote-transcode-folder-1080p.sh

same as transcode-folder-1080p but it uses a remote ssh server to transcode the video

## bulkshell.sh

ssh to a "cluster" of hosts
requires tmux
requires a "cluster" varible set IE
```
$ echo $piCluster
pi@pi-1;pi@pi-2;pi@pi-3
```
varible should be multiple ssh strings in a semicolon seperated string
example usage:
```
$ bulkshell piCluster "sudo apt-get upgrade -y"
...
```
