FROM ruby:2.7.3-alpine

WORKDIR /app

# Application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .