FROM ruby:2.5
 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#PostgreSQL
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Install capybara-webkit deps
RUN apt-get update \
    && apt-get install -y xvfb qt5-default libqt5webkit5-dev \
                          gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn
 
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY package.json yarn.lock /usr/src/app/
 
RUN bundle install
RUN yarn install
 
COPY . /usr/src/app
 
EXPOSE 3000
CMD puma -C config/puma.rb