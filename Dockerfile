FROM node:6.3-slim

VOLUME /usr/src/app/

EXPOSE 8080

RUN useradd -ms /bin/bash developer && \
  mkdir -p /home/developer/.npm-global && \
  chown developer:developer /home/developer/.npm-global && \
  su developer -c "npm config set prefix /home/developer/.npm-global" && \
  su developer -c "npm i -g yo"

# Runtime user
ENV PATH /home/developer/.npm-global/bin:${PATH}
USER developer
WORKDIR /home/developer
