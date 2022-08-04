# ----- Build layer -----
FROM node:16.16.0-bullseye-slim AS builder

LABEL maintainer="ega4432 <hello@egashira.dev>"
ENV NODE_ENV production

WORKDIR /usr/local/app

COPY ./package*.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# ----- Runtime layer -----
FROM nginx:1.23.1

COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/local/app/build /usr/share/nginx/html

USER nginx
EXPOSE 8080

CMD [ "nginx", "-g", "daemon off;" ]
