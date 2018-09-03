#!/bin/bash
xvfb-run -s "-screen 0 1024x768x24" /opt/eclipse/eclimd \
  -Dnailgun.server.host=0.0.0.0 \
  -Dosgi.instance.area.default=$1
