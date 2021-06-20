FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /desafio-backend
COPY Gemfile /desafio-backend/Gemfile
COPY Gemfile.lock /desafio-backend/Gemfile.lock
RUN bundle install
COPY . /desafio-backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]