FROM cm2network/steamcmd:latest

COPY --chown=steam:steam ./resources/palworld.sh /home/steam/palworld.sh

RUN ["chmod", "+x", "/home/steam/palworld.sh"]

ENTRYPOINT ["/home/steam/palworld.sh"]