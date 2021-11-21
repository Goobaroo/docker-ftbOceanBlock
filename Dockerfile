# syntax=docker/dockerfile:1

FROM openjdk:8-buster

LABEL version="1.9.0"

RUN apt-get update && apt-get install -y curl && \
 addgroup minecraft && \
 adduser --home /data --ingroup minecraft --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]

ENV MOTD "A Minecraft (FTB OceanBlock 1.9.0) Server Powered by Docker"
ENV LEVEL world
ENV JVM_OPTS "-Xms4096m -Xmx6144m"
