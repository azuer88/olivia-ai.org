FROM node:lts-alpine

RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN VUE_APP_URL=ws://localhost:8080 npm run build

EXPOSE $WEBPORT
CMD http-server dist -p $WEBPORT
