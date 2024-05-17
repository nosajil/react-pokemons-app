FROM node:16

RUN apt-get update && apt-get install -y netcat

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

COPY wait-for-backend.sh .

ENTRYPOINT ["./wait-for-backend.sh"]

EXPOSE 3001

CMD ["npm", "start"]
