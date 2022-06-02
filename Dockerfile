FROM --platform=linux/arm64/v8 python:3.9-alpine
RUN apk update && apk add --no-cache --virtual build-dependencies \
  procps make gcc g++ curl wget bash sudo nodejs npm

RUN wget https://github.com/mikefarah/yq/releases/download/v4.12.2/yq_linux_arm.tar.gz -O - |\
      tar xz && mv yq_linux_arm /usr/bin/yq

WORKDIR /app/
COPY lightning-jet/ /app/

RUN npm install --build-from-source --python=$(which python3)

ENV PATH="/app:${PATH}"

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
ADD assets/utils/check-web.sh /usr/local/bin/check-web.sh
RUN chmod +x /usr/local/bin/check-web.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]