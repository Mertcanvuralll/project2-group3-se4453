FROM node:22

# SSH kurulumu
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# App klasörü
WORKDIR /app

# Dosyaları kopyala
COPY package*.json ./
RUN npm install

COPY . .

# Portlar
EXPOSE 3000
EXPOSE 22

# SSH + App başlat
CMD ["sh", "-c", "service ssh start && npm start"]
