FROM java:7
MAINTAINER Roni Thomas <ronicthomas@gmail.com>

# clean apt cache
RUN apt-get clean

# install sdkman
RUN curl -s get.sdkman.io | bash
ADD bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/sdkman*

ENTRYPOINT ["sdkman-exec.sh"]
VOLUME ["/root/.sdkman/candidates/"]