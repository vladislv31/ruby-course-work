FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update && apt-get install -y libpq-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install --jobs 4 --retry 3

COPY . .

# RUN bundle exec rails db:migrate
CMD ["rails", "db:migrate"]
CMD ["rails", "server", "-b", "0.0.0.0"]
