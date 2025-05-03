# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t biomarker .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name biomarker biomarker

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.4
FROM docker.io/library/ruby:$RUBY_VERSION-slim

RUN mkdir -p /usr/local/bundle

ENV NODE_VERSION=18.20.4
ENV NVM_VERSION=0.39.7
ENV NVM_DIR=/root/.nvm
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
ENV NODE_OPTIONS=--max_old_space_size=3096

# Rails app lives here
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips libpq-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} && nvm use v${NODE_VERSION} && nvm alias default v${NODE_VERSION}

# Install Yarn
RUN npm install -g yarn

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git pkg-config libpq-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN echo "gem: --no-document" >> ~/.gemrc
RUN gem update --system
RUN gem install bundler -v 2.5.4

RUN yarn install
# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 8 --retry 2

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile
