FROM codehz/archlinux:latest

LABEL       author="FanHuaCloud" maintainer="1157173310@qq.com"

RUN         adduser -D -h /home/container container
RUN         pacman -Syu --noconfirm --needed base-devel curl sqlite3 gcc make clang readline python python-pip wget unzip && yes | pacman -Scc && rm -fr /var/lib/pacman/sync/* && pip install ply

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
