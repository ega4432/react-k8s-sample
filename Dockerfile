FROM node:16.13.0-alpine AS builder

LABEL maintainer="ega4432 <ysmtegsr@gmail.com>"

WORKDIR /usr/local/app

COPY . .

RUN yarn --frozen-lockfile && \
    yarn build

FROM nginx:1.20-alpine

COPY --from=builder /usr/local/app/build /usr/share/nginx/html

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
