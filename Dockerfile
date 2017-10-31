FROM debian:latest
MAINTAINER Darren Williams <support@directvoip.co.uk>

# Install Required Dependencies
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt=get install -y wget
RUN wget -O - https://raw.githubusercontent.com/fusionpbx/fusionpbx-install.sh/master/debian/pre-install.sh | sh \
&& cd /usr/src/fusionpbx-install.sh/debian && ./install.sh
USER root
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-freeswitch.sh /usr/bin/start-freeswitch.sh
VOLUME ["/var/lib/postgresql", "/etc/freeswitch", "/var/lib/freeswitch", "/usr/share/freeswitch", "/var/www/fusionpbx"]
CMD /usr/bin/supervisord -n






