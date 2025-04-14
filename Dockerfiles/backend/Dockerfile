FROM node:16-alpine

WORKDIR /app

COPY package.json ./

RUN yarn

COPY . .

ENV REDIS_URL='redis://redis-db:6379'
ENV REDIS_REPLICAS_URL=$REDIS_URL
ENV PORT=3000

EXPOSE 3000

CMD ["node", "main.js"]
