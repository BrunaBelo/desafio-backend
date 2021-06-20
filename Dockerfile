FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn
WORKDIR /desafio-backend
COPY Gemfile /desafio-backend/Gemfile
COPY Gemfile.lock /desafio-backend/Gemfile.lock
RUN bundle install

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . /desafio-backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
