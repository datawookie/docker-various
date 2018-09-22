FROM ubuntu:16.04

RUN apt-get update && \
    apt install -y \
    wget \
      libpaper1 \
      libavformat-ffmpeg56 \
      libavcodec-ffmpeg56 \
      libswresample-ffmpeg1 \
      libswscale-ffmpeg3 \
      libavutil-ffmpeg54 \
      libx11-6 \
      libqt5webkit5 \
      libqt5svg5 \
      libqt5multimediawidgets5 \
      libqt5multimedia5 \
      libqt5xml5 \
      libqt5script5 \
      onboard \
      libqt5multimedia5-plugins

RUN wget https://github.com/OpenBoard-org/OpenBoard/releases/download/v1.4.1/openboard_ubuntu_16.04_1.4.1_amd64.deb && \
    dpkg -i openboard_ubuntu_16.04_1.4.1_amd64.deb && \
    rm openboard_ubuntu_16.04_1.4.1_amd64.deb

CMD /usr/bin/openboard
