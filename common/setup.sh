
#!/bin/sh
#  vim:ts=4:sts=4:sw=4:et

set -eu
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(dirname "$0")"

repo="https://github.com/HariSekhon/DevOps-Bash-tools"

directory="common"

packages="bash git make curl sudo tmux curl git-core gnupg locales zsh wget vim nano emacs"

export DEBIAN_FRONTEND=noninteractive

if type apk >/dev/null 2>&1;then
    apk --no-cache add $packages
    elif type apt-get >/dev/null 2>&1; then
    apt-get update --allow-insecure-repositories
    apt-get install -y --allow-unauthenticated $packages
    elif type yum >/dev/null 2>&1; then
    yum install -y $packages
else
    echo "Package Manager not found on Linux, cannot bootstrap"
    exit 1
fi
