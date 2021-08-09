FROM amazoncorretto:11@sha256:75558b1ec7aa332e62f57f708fb82aa1a648a4e4840ada287a00b8c656e066a0

ADD install.sh /
RUN /install.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
