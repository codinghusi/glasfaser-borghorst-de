FROM node:latest

RUN apt-get update && apt-get -y install -qq --force-yes cron

RUN mkdir -p /app/public

WORKDIR /app
ADD package.json scrape-progress.js /app/

ADD public/index.html public/style.css /app/public/

RUN npm install

ADD cronjob.txt /app
RUN chmod 0644 /app/cronjob.txt
RUN crontab /app/cronjob.txt

CMD ["node", "/app/serve.js"]