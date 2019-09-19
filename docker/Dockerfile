FROM ruby:2.5.6

LABEL maintainer="charris000@gmail.com"

WORKDIR /opt/rt_plan_classifier

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN gem install bundler
COPY ./src/rt_plan_classifier/Gemfile ./Gemfile
COPY ./src/rt_plan_classifier/Gemfile.lock ./Gemfile.lock
RUN bundle install

COPY ./src/rt_plan_classifier ./

# Copy over app
COPY ./docker/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rt_plan_classifier"]

EXPOSE 8000
