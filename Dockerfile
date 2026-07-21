# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.0.6
FROM ruby:${RUBY_VERSION}-slim

WORKDIR /myapp

ENV RAILS_ENV="development" \
  BUNDLE_PATH="/usr/local/bundle"

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config default-mysql-client curl && \
  rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

RUN chmod +x entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bash", "-lc", "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b 0.0.0.0"]
