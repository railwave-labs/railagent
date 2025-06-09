FROM ruby:3.3

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

CMD ["ruby", "app.rb"]