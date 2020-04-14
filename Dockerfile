FROM ubuntu:16.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*


COPY /run_gotty.sh /run_gotty.sh

RUN chmod 744 /run_gotty.sh

EXPOSE 8080

CMD ["/bin/bash","/run_gotty.sh"]
