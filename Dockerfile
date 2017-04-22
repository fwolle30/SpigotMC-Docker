FROM debian:latest

MAINTAINER Frank Wolbring <fwolbring@googlemail.com>

EXPOSE 25565 8123

WORKDIR /data
VOLUME /data

ADD init.sh /data
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar /data

RUN chmod +x /data/init.sh && /data/init.sh;
RUN java -jar BuildTools.jar

CMD echo "eula=true" >> eula.txt && java -Xmx1G -jar spigot-1.11.2.jar