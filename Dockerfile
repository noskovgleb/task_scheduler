FROM ruby:3.3.0

WORKDIR /app

RUN apt-get update && apt-get install -y \
    && curl -sSL https://deb.nodesource.com/setup_18.x | bash - \
    && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends nodejs yarn \
    && apt-get update && apt-get install -y nodejs yarn postgresql-client

COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
RUN yarn install

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]