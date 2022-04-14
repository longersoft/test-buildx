# FROM gcr.io/google-appengine/debian9:latest

# RUN apt-get update && \
#   apt-get install -y curl

# CMD echo "It's worked!"

FROM alpine

RUN echo "Hello, my CPU architecture is $(uname -m)"

RUN apk add curl
RUN curl http://stash.compciv.org/ssa_baby_names/names.zip --output babynames.zip
RUN ls -la

