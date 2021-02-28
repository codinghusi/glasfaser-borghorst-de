FROM cloudron/base:3.0.0

RUN apt-get update && apt-get -y install -qq --force-yes cron && apt-get -y install -qq --force-yes git

RUN mkdir -p /app/public

WORKDIR /app
ADD package.json scrape-progress.js serve.js start.sh /app/

ADD public/index.html public/style.css /app/public/

RUN npm install

ADD cronjob.txt /app
RUN chmod 0644 /app/cronjob.txt
RUN crontab /app/cronjob.txt

CMD ["/app/start.sh"]