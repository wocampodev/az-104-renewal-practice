FROM node:22-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
RUN npm install -g pnpm

WORKDIR /home/node/app

COPY package*.json ./
RUN pnpm install

USER node

COPY --chown=node:node . .

EXPOSE 80

CMD [ "node", "index.mjs" ]
