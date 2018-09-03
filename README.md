# docker-eclimd

Docker image to run eclimd and use it from host-side vim / emacs.

## Usage

```
## Tweak vim setting
$ vi ~/.vimrc
set nocompatible
filetype plugin indent on

## Clone this repository
$ git clone https://github.com/tily/docker-eclimd.git && cd docker-eclimd/

## Prepare eclipse workspace
$ mkdir -p /home/tily/eclipse-workspace
$ vi .env
WORKSPACE_PATH=/home/tily/eclipse-workspace

## Run eclimd
$ docker-compose up -d

## Copy necessary files from container to host
$ mkdir -p ~/.vim ~/.eclim/
$ docker cp dockereclimd_eclim_1:/home/eclim/.vim/eclim ~/.vim/
$ docker cp dockereclimd_eclim_1:/home/eclim/.vim/plugin ~/.vim/
$ docker cp dockereclimd_eclim_1:/home/eclim/.eclim/.eclimd_instances ~/.eclim/.eclimd_instances
$ sudo mkdir -p /opt/eclipse/plugins/org.eclim_3.8.0/bin/
$ sudo docker cp dockereclimd_eclim_1:/opt/eclipse/plugins/org.eclim_2.8.0/bin/eclim /opt/eclipse/plugins/org.eclim_2.8.0/bin/eclim
$ sudo docker cp dockereclimd_eclim_1:/opt/eclipse/plugins/org.eclim_2.8.0/bin/ng /opt/eclipse/plugins/org.eclim_2.8.0/bin/ng
```
