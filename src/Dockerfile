FROM amazoncorretto:11@sha256:eac8bd7aafead38ec1e0be008814a23739cc7f94fce908326cf1a994c946a121

ADD install.sh /
RUN /install.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
