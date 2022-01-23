# Usage:
# $ xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
# $ docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw -e XAUTHORITY=/tmp/.docker.xauth dockerfiles-firefox:x11

FROM alpine:latest
LABEL maintainer="John Stilia <stilia.johny@gmail.com>"

# Username
ARG USER=devuser
ARG PASS=devpass
ARG UID=1234
ARG GID=5678


ENV TERM xterm-256color

# Set Shell
SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk --no-cache --no-progress upgrade && \
    apk add --no-cache \
    bash git make curl sudo tmux curl shadow gnupg zsh wget vim nano emacs \
    nmap nmap-scripts \
    perl \
    perl-net-ssleay

RUN apk add --no-cache firefox xauth

#Add new user with our credentials
ENV USERNAME ${USER}
ENV PASSWORD ${PASS}
RUN useradd -m $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod  --uid ${UID} $USERNAME && \
    groupmod --gid ${GID} $USERNAME

RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


RUN apk add --no-cache msttcorefonts-installer fontconfig
RUN update-ms-fonts

USER $USER

RUN wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

WORKDIR "/home/$USER"

EXPOSE 8887

CMD ["firefox"]