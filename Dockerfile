FROM sitespeedio/node:ubuntu-18.04-nodejs10.15.3
 
ARG DEBIAN_FRONTEND=NONINTERACTIVE
ARG DOCKER_VERSION=17.06.0-CE

RUN apt-get update && \
apt-get install -y libglu1 xvfb libxcursor1 unrar jq

RUN apt-get update && \
apt-get install -y ca-certificates && \
update-ca-certificates
 
EXPOSE 3389/TCP
EXPOSE 7778/TCP
EXPOSE 7778/UDP

RUN npm install pm2 -g
COPY package.json /ROOT/package.json
COPY package-lock.json /ROOT/package-lock.json
WORKDIR /ROOT/
RUN npm install

# ADD https://www.google.com /time.now


ARG BUILD_URL
ADD $BUILD_URL /ROOT/BUILD.rar
RUN chmod +x /ROOT/BUILD.rar
RUN unrar x /ROOT/BUILD.rar /ROOT/
RUN rm /ROOT/BUILD.rar
COPY BOOT.SH /BOOT.SH

ARG DATA_SERVER
ARG GAME_SERVER

ENV DATA_SERVER=$DATA_SERVER
ENV GAME_SERVER=$GAME_SERVER

COPY DeploymentConfig.json /ROOT/BUILD/Server_Data/StreamingAssets/DeploymentConfig.json

WORKDIR /ROOT/
RUN ["chmod", "+x", "/ROOT/BUILD/Server.x86_64"]

COPY pm2.json /ROOT/pm2.json
COPY index.js /ROOT/index.js
COPY BOOT.SH /ROOT/BOOT.SH
COPY preprocess.sh ./preprocess.sh

CMD ["pm2-runtime", "start", "pm2.json"]
