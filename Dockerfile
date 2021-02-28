FROM node:latest

RUN apt-get update && apt-get -y install -qq --force-yes cron

RUN mkdir -p /app/public

WORKDIR /app
ADD package.json scrape-progress.js /app/
ADD index.html style.css /app/public/

ADD cronjob.txt /app
RUN npm install
RUN crontab /app/cronjob.txt

CMD ["node /app/serve.js"]