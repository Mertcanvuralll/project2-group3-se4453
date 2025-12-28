FROM node:22

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
EXPOSE 22

CMD ["npm", "start"]

