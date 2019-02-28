# Docker Live -> Assistir novamente pra pegar melhor tudo!

- Comandos do docker para executar uma imagem pelo terminal
  docker pull image:version (sudo docker... caso dê daemon error) <!-- Isso é pra baixar uma imagem do docker-hub -->
  - Exemplo Mongo: docker run --name dbmongo -p 27017:27017 (port docker:port local) -d mongo (nome da imagem)

Cria o arquivo Dockerfile e configure-o:

```javascript
  FROM node:alpine

  // # aqui eu crio uma pasta pro servidor
  RUN mkdir /usr/app
  // # define a pasta de trabalho para os próximos comandos
  WORKDIR /usr/app

  // # copia os arquivos necessários para baixar as dependências
  COPY package.json yarn.lock ./
  // # instala as dependências
  RUN yarn

  // # copia todos os arquivos após instalar as dependências
  COPY . ./

  // # expõe a porta para escutar chamadas (node)
  EXPOSE 3000

  CMD nodemon index.js

```

Docker Compose:

```javascript
  touch docker-compose.yml
```

```javascript

version: "3"

services:
  database:
    image: mongo

  app:
    // #    image: caso tenha uma imagem no dockerhub
    // #    build: quando a imagem está na máquina
    build: .
    ports:
      - "3001:3000"
      // # port local:port docker
    environment:
      - DB_URL=database
    // # cria uma variável de ambiente para utilizarmos na aplicação
    command: yarn dev
    // # executa o comando do package.json para executar o nodemon, pois aqui direto ele não reconheceria o nodemon como comando bash
    depends_on:
      - database
    // # define a imagem que o app depende
    volumes:
      - ".:/usr/app"
```

-Run: sudo docker-compose up -d --build

# Estudar kubernets para conseguir orquestrar as imagens do docker para produção
