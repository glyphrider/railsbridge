FROM ruby:2.2.5

ENV HOME /home/rails/webapp
ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev

WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install

ADD . $HOME/

CMD ["bundle","exec","rails","server","--binding","0.0.0.0"]
