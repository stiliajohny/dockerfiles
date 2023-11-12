# docker run -it --rm --network=host dockerfiles-nikto -h

FROM alpine:3.17.5
LABEL maintainer="John Stilia <stilia.johny@gmail.com>"

# User and Password , Change on demand

ENV USER=devuser
ENV UID=12345
ENV GID=23456

ENV TERM xterm-256color

# Set Shell
SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk --no-cache --no-progress upgrade && \
    apk add --no-cache \
    bash git make curl sudo tmux curl shadow gnupg zsh wget vim nano emacs \
    perl \
    perl-net-ssleay

RUN addgroup "$USER" --system &&\
    adduser \
    --disabled-password \
    --gecos "User" \
    --home "/home/$USER" \
    --ingroup "$USER" \
    -s /bin/zsh \
    --uid "$UID" \
    "$USER"

RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN git clone https://github.com/sullo/nikto /app

USER $USER

RUN wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

WORKDIR /home/$USER

ENTRYPOINT ["/app/program/nikto.pl"]