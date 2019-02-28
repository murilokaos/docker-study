FROM node:alpine

# aqui eu crio uma pasta pro servidor
RUN mkdir /usr/app 
# define a pasta de trabalho para os próximos comandos
WORKDIR /usr/app

# copia os arquivos necessários para baixar as dependências
COPY package.json yarn.lock ./
# instala as dependências
RUN yarn

# copia todos os arquivos após instalar as dependências
COPY . ./

# expõe a porta para escutar chamadas (node)
EXPOSE 3000

CMD nodemon index.js
