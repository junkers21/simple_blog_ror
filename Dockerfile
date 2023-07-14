FROM ruby:3.2.1-alpine3.17

RUN apk add --no-cache bash
RUN /bin/sh
RUN apk --update add nodejs netcat-openbsd mysql-client tzdata
RUN apk --update add --virtual build-dependencies build-base make g++ mariadb-dev

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .

COPY entry.sh /usr/bin/
RUN chmod +x /usr/bin/entry.sh

ENTRYPOINT ["entry.sh"]
EXPOSE 3000
CMD bundle exec rails server -e production -b 0.0.0.0