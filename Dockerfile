FROM node:alpine AS Builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm build 

FROM  nginx
COPY --from=Builder /app/build /usr/share/nginx/html
