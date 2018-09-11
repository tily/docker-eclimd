FROM openjdk:8

RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker
RUN USER=docker && \
    GROUP=docker && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

RUN apt-get update && apt-get install -y xvfb build-essential
RUN cd /opt/ && \
    wget -q http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/photon/R/eclipse-dsl-photon-R-linux-gtk-x86_64.tar.gz && \
    tar xvf eclipse-dsl-photon-R-linux-gtk-x86_64.tar.gz && \
    rm eclipse-dsl-photon-R-linux-gtk-x86_64.tar.gz
RUN cd /opt/ && \
    wget -q https://github.com/ervandew/eclim/releases/download/2.8.0/eclim_2.8.0.bin && \
    chmod a+x eclim_2.8.0.bin && \
    mkdir -p /home/eclim/.vim && \
    ./eclim_2.8.0.bin \
      --yes \
      --eclipse=/opt/eclipse/ \
      --vimfiles=/home/eclim/.vim \
      --plugins=jdt && \
    rm eclim_2.8.0.bin
RUN chown -R docker:docker /opt/eclipse/

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod a+x /sbin/entrypoint.sh

USER docker:docker
ENTRYPOINT ["fixuid", "/sbin/entrypoint.sh"]
