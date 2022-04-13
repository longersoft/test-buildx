# # build stage
# FROM --platform=$TARGETPLATFORM node:13-alpine as build-stage

# ARG TARGETPLATFORM
# ARG BUILDPLATFORM
# RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

# WORKDIR /app
# COPY reactjs .
# RUN npm install
# RUN npm run build

# # production stage
# FROM nginx:1.17-alpine as production-stage
# COPY --from=build-stage /app/build /usr/share/nginx/html
# CMD ["nginx", "-g", "daemon off;"]


FROM alpine

RUN echo "Hello, my CPU architecture is $(uname -m)"

RUN apk add curl
RUN curl http://stash.compciv.org/ssa_baby_names/names.zip --output babynames.zip
RUN ls -la
