FROM binlab/alpine-glibc

LABEL maintainer="Mark Binlab <mark.binlab@gmail.com>"

ENV DROPBOX_VERSION 56.4.94

RUN addgroup -S dropbox \
	&& adduser -D -S -h /var/lib/dropbox -s /sbin/nologin -G dropbox dropbox \
	&& wget -O /tmp/dropbox.tgz \
	   -q https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-$DROPBOX_VERSION.tar.gz \
	&& tar -zxf /tmp/dropbox.tgz -C /tmp \
	&& mkdir /usr/lib/dropbox/ \
	&& mv /tmp/.dropbox-dist/dropbox-lnx.x86_64-$DROPBOX_VERSION/* /usr/lib/dropbox/ \
	&& chown -R root:root /usr/lib/dropbox/ \
	&& rm -rf /tmp/dropbox.tgz /tmp/.dropbox-dist

USER dropbox

VOLUME /var/lib/dropbox

CMD ["/usr/lib/dropbox/dropbox"]
