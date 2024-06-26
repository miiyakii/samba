FROM alpine:edge

RUN set -eu && \
    apk --no-cache add \
    # bash \
    tini \
    samba && \
    adduser -D samba && \
    echo -e "800217\n800217" | smbpasswd -a -s samba 
    # addgroup -S smb && \
   # rm -f /etc/samba/smb.conf 
    # rm -rf /tmp/* /var/cache/apk/*

# COPY --chmod=755 samba.sh /usr/bin/samba.sh
COPY smb.conf /etc/samba/smb.conf

VOLUME /storage
EXPOSE 139 445

ENV USER "samba"
ENV PASS "secret"

ENV UID 1000
ENV GID 1000
ENV RW true

# HEALTHCHECK --interval=60s --timeout=15s CMD smbclient -L \\localhost -U % -m SMB3
CMD smbd --foreground --no-process-group
#ENTRYPOINT ["/sbin/tini", "--", "smbd", "--foreground", "--no-process-group"]
#ENTRYPOINT ["/bin/sh"]