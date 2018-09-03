FROM openjdk:8

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

RUN useradd eclim && \
    mkdir -p /home/eclim/ && \
    chown -R eclim:eclim /opt/eclipse/ /home/eclim/

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod a+x /sbin/entrypoint.sh
ENTRYPOINT ["/sbin/entrypoint.sh"]

USER eclim
