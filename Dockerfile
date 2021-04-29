FROM ubuntu:20.04
LABEL MAINTAINER "Uwe Dauernheim <uwe@dauernheim.net>"

# Suppress warning about UTF-8
ENV LC_CTYPE=POSIX
ENV OVFTOOL_FILENAME=VMware-ovftool-4.4.0-15722219-lin.x86_64.bundle

ADD $OVFTOOL_FILENAME /tmp/

WORKDIR /root

RUN /bin/sh /tmp/$OVFTOOL_FILENAME --console --required --eulas-agreed && \
    rm -f /tmp/$OVFTOOL_FILENAME

ENTRYPOINT ["ovftool"]
