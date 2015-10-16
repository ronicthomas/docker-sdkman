FROM java:8u40-b22-jdk
MAINTAINER Patrick Huetter <p.huetter@encircle360.com>

ENTRYPOINT ["sdkman-exec.sh"]

# clean apt cache
RUN apt-get clean

# install sdkman
RUN curl -s get.sdkman.io | bash
ADD sdkman.config /.sdkman/etc/config
ADD bin/ /usr/local/bin/
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh"