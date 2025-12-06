# syntax=docker/dockerfile:1

FROM eclipse-temurin:8-jre-noble

LABEL version="1.16.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB OceanBlock"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/af/af4ef40799823b2cde0c85e46f9cbd855b92c2117304f913bba0436df72f7774.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBOceanBlock:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB OceanBlock v1.16.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]