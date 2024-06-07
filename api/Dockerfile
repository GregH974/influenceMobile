# Base image
FROM ruby:3.2.1

ARG USER_ID=0
ARG USER_NAME=root

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client nano

RUN if ! id -u $USER_NAME; then adduser -u $USER_ID $USER_NAME --force-badname; fi

ENV APP_HOME /api
RUN mkdir $APP_HOME && chown -R $USER_NAME:$USER_NAME $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN chown -R $USER_NAME:$USER_NAME $APP_HOME

# The commands below will be ran as the app user
USER $USER_NAME

COPY . .
COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY --chmod=0755 entrypoint.sh /usr/bin/
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
