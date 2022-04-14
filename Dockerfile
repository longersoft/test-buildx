FROM gcr.io/google-appengine/debian9:latest

RUN apt-get update && \
  apt-get install -y curl

CMD echo "It's worked!"
