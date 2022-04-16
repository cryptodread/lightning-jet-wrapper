FROM arm64v8/node:latest

ADD . /
RUN cd lightning-jet && npm install --build-from-source --python=/usr/bin/python3

WORKDIR /

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
ADD assets/utils/check-web.sh /usr/local/bin/check-web.sh
RUN chmod +x /usr/local/bin/check-web.sh

WORKDIR /lightning-jet/

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]