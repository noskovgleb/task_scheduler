FROM ruby:3.1.2

WORKDIR /app

RUN apt-get update && apt-get install -y \
    && curl -sSL https://deb.nodesource.com/setup_18.x | bash - \
    && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends nodejs yarn \
    && useradd --create-home ruby \
    && chown ruby:ruby -R /app \
    && chown ruby:ruby -R /usr/local \
    && apt-get update && apt-get install -y nodejs yarn postgresql-client

USER ruby

COPY --chown=ruby:ruby Gemfile* ./
RUN gem update --system
RUN bundle install
RUN yarn install

# Add a script to be executed every time the container starts.
COPY --chown=ruby:ruby entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY --chown=ruby:ruby . .

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]