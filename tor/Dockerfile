FROM alpine:3.17.3
LABEL maintainer="John Stilia <stilia.johny@gmail.com>"

# ENV USER=devuser
# ENV UID=12345
# ENV GID=23456

# ENV TERM xterm-256color

# Set Shell
SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk --no-cache --no-progress upgrade && \
    apk add --no-cache \
    bash git make curl sudo tmux shadow gnupg zsh wget vim nano emacs privoxy shadow tini tor tzdata

# RUN addgroup "$USER" --system &&\
#     adduser \
#     --disabled-password \
#     --gecos "User" \
#     --home "/home/$USER" \
#     --ingroup "$USER" \
#     -s /bin/zsh \
#     --uid "$UID" \
#     "$USER"

# RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "tor ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# RUN file='/etc/privoxy/config' && \
#     cp /etc/privoxy/config.new /etc/privoxy/config && \
#     sed -i 's|^\(accept-intercepted-requests\) .*|\1 1|' $file && \
#     sed -i '/^listen/s|127\.0\.0\.1||' $file && \
#     sed -i '/^listen.*::1/s|^|#|' $file && \
#     sed -i 's|^\(logfile\)|#\1|' $file && \
#     sed -i 's|^#\(log-messages\)|\1|' $file && \
#     sed -i 's|^#\(log-highlight-messages\)|\1|' $file && \privoxy
#     sed -i '/forward *localhost\//a forward-socks5t / 127.0.0.1:9050 .' $file&&\
#     sed -i '/^forward-socks5t \//a forward 172.16.*.*/ .' $file && \
#     sed -i '/^forward 172\.16\.\*\.USER\*\//a forward 172.17.*.*/ .' $file && \
#     sed -i '/^forward 172\.17\.\*\.\*\//a forward 172.18.*.*/ .' $file && \
#     sed -i '/^forward 172\.18\.\*\.\*\//a forward 172.19.*.*/ .' $file && \
#     sed -i '/^forward 172\.19\.\*\.\*\//a forward 172.20.*.*/ .' $file && \
#     sed -i '/^forward 172\.20\.\*\.\*\//a forward 172.21.*.*/ .' $file && \
#     sed -i '/^forward 172\.21\.\*\.\*\//a forward 172.22.*.*/ .' $file && \
#     sed -i '/^forward 172\.22\.\*\.\*\//a forward 172.23.*.*/ .' $file && \
#     sed -i '/^forward 172\.23\.\*\.\*\//a forward 172.24.*.*/ .' $file && \
#     sed -i '/^forward 172\.24\.\*\.\*\//a forward 172.25.*.*/ .' $file && \
#     sed -i '/^forward 172\.25\.\*\.\*\//a forward 172.26.*.*/ .' $file && \
#     sed -i '/^forward 172\.26\.\*\.\*\//a forward 172.27.*.*/ .' $file && \
#     sed -i '/^forward 172\.27\.\*\.\*\//a forward 172.28.*.*/ .' $file && \
#     sed -i '/^forward 172\.28\.\*\.\*\//a forward 172.29.*.*/ .' $file && \
#     sed -i '/^forward 172\.29\.\*\.\*\//a forward 172.30.*.*/ .' $file && \
#     sed -i '/^forward 172\.30\.\*\.\*\//a forward 172.31.*.*/ .' $file && \
#     sed -i '/^forward 172\.31\.\*\.\*\//a forward 10.*.*.*/ .' $file && \
#     sed -i '/^forward 10\.\*\.\*\.\*\//a forward 192.168.*.*/ .' $file && \
#     sed -i '/^forward 192\.168\.\*\.\*\//a forward 127.*.*.*/ .' $file && \
#     sed -i '/^forward 127\.\*\.\*\.\*\//a forward localhost/ .' $file

RUN echo 'AutomapHostsOnResolve 1' >>/etc/tor/torrc && \
    echo 'ControlPort 9051' >>/etc/tor/torrc && \
    echo 'ControlSocket /etc/tor/run/control' >>/etc/tor/torrc && \
    echo 'ControlSocketsGroupWritable 1' >>/etc/tor/torrc && \
    echo 'CookieAuthentication 1' >>/etc/tor/torrc && \
    echo 'CookieAuthFile /etc/tor/run/control.authcookie' >>/etc/tor/torrc && \
    echo 'CookieAuthFileGroupReadable 1' >>/etc/tor/torrc && \
    echo 'DNSPort 5353' >>/etc/tor/torrc && \
    echo 'DataDirectory /var/lib/tor' >>/etc/tor/torrc && \
    echo 'ExitPolicy reject *:*' >>/etc/tor/torrc && \
    echo 'Log notice stderr' >>/etc/tor/torrc && \
    echo 'RunAsDaemon 0' >>/etc/tor/torrc && \
    echo 'SocksPort 0.0.0.0:9050 IsolateDestAddr' >>/etc/tor/torrc && \
    echo 'TransPort 0.0.0.0:9040' >>/etc/tor/torrc && \
    echo 'ExitNodes {CA} StrictNodes 1' >>/etc/tor/torrc && \
    echo 'User tor' >>/etc/tor/torrc && \
    echo 'VirtualAddrNetworkIPv4 10.192.0.0/10' >>/etc/tor/torrc && \
    mkdir -p /etc/tor/run && \
    chown -Rh tor. /var/lib/tor /etc/tor/run && \
    chmod 0750 /etc/tor/run && \
    rm -rf /tmp/*

# COPY torproxy.sh /usr/bin/

# USER $USER

# RUN wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# WORKDIR /home/$USER

HEALTHCHECK --interval=60s --timeout=15s --start-period=20s \
    CMD curl -sx localhost:8118 'https://check.torproject.org/' | \
    grep -qm1 Congratulations

EXPOSE 8118 9050 9051

VOLUME ["/etc/tor", "/var/lib/tor"]


ENTRYPOINT ["/usr/bin/tor"]