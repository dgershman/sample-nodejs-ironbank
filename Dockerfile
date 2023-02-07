FROM registry1.dso.mil/ironbank/opensource/nodejs/nodejs16:16.17.1 as build

USER root

WORKDIR /opt

ENV NODE_ENV production

COPY . /opt
RUN npm install

FROM registry1.dso.mil/ironbank/opensource/nodejs/nodejs16:16.17.1

USER node

COPY --from=build --chown=node:node /opt /opt

WORKDIR /opt

CMD ["npm", "start"]
