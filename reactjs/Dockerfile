# build stage
FROM --platform=$TARGETPLATFORM node:13-alpine as build-stage
WORKDIR /app
COPY reactjs .
RUN npm install
RUN npm run build

RUN ls -la

# production stage
FROM nginx:1.17-alpine as production-stage
COPY --from=build-stage /app/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
