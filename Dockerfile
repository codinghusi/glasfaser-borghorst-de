FROM cloudron/base:3.0.0

RUN apt-get update && apt-get -y install -qq --force-yes cron && apt-get -y install -qq --force-yes git

RUN mkdir -p /app/data/public

WORKDIR /app/data
ADD package.json scrape-progress.js serve.js start.sh /app/data/

ADD public/index.html public/style.css /app/data/public/

RUN npm install

ADD cronjob.txt /app/data
RUN chmod 0644 /app/data/cronjob.txt
RUN crontab /app/data/cronjob.txt

RUN node scrape-progress.js

CMD ["/app/data/start.sh"]
