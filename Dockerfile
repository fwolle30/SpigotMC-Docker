FROM debian:latest

MAINTAINER Frank Wolbring <fwolbring@googlemail.com>

EXPOSE 25565

WORKDIR /data
VOLUME /data

RUN apt-get -y update;apt-get -y install curl;curl https://gist.githubusercontent.com/fwolle30/17a67e4475c589b6671f8a5a368c332b/raw/31568ad391746b201288ca5fea34621f3e6d6f50/init.sh -O;chmod +x init.sh;./init.sh;

CMD echo "eula=true" >> eula.txt && java -Xmx1G -jar spigot-1.11.2.jar