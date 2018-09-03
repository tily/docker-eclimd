# docker-eclimd

Docker image to run eclimd and use it from host-side vim / emacs.

## Usage

```
## Clone this repository
$ git clone https://github.com/tily/docker-eclimd.git && cd docker-eclimd/

## Prepare eclipse workspace
$ mkdir -p /home/tily/eclipse-workspace
$ vi .env
WORKSPACE_PATH=/home/tily/eclipse-workspace

## Run eclimd
$ docker-compose up -d
```

TODO: put the files below to the host system:

* `$HOME/.vim/eclim`
* `$HOME/.vim/plugin`
* `$HOME/.eclim/.eclimd_instances`
* `/opt/eclipse/plugins/org.eclim_3.8.0/bin/eclim`
* `/opt/eclipse/plugins/org.eclim_2.8.0/bin/ng`
