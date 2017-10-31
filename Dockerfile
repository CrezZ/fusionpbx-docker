FROM debian:latest
MAINTAINER Darren Williams <support@directvoip.co.uk>

# Install Required Dependencies
RUN apt-get update \
	&& apt-get upgrade -y \
RUN wget https://raw.githubusercontent.com/fusionpbx/fusionpbx-install.sh/master/install.sh -O install.sh && sh install.sh
USER root
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start-freeswitch.sh /usr/bin/start-freeswitch.sh
VOLUME ["/var/lib/postgresql", "/etc/freeswitch", "/var/lib/freeswitch", "/usr/share/freeswitch", "/var/www/fusionpbx"]
CMD /usr/bin/supervisord -n






