FROM cloudron/base:3.0.0

RUN apt-get update && apt-get -y install -qq git

RUN mkdir -p /app/data/public

WORKDIR /app/data
ADD package.json scrape-progress.js serve.js start.sh /app/data/

ADD public/index.html public/style.css /app/data/public/

RUN npm install

RUN node scrape-progress.js

CMD ["/app/data/start.sh"]
