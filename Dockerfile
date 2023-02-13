FROM node:16 as build

USER root

WORKDIR /opt

ENV NODE_ENV production

COPY . /opt
RUN npm install

FROM node:16

USER node

COPY --from=build --chown=node:node /opt /opt

WORKDIR /opt

CMD ["npm", "start"]
