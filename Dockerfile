ARG RUBY_VERSION=3.2.0

FROM ruby:$RUBY_VERSION-slim

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libvips gnupg2 curl git vim

# Ensure node.js 18 is available for apt-get
ARG NODE_MAJOR=18
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Install node and yarn
RUN apt-get update -qq && apt-get install -y nodejs && npm install -g yarn

# add user
RUN useradd -m -u 1000 rails

# Mount $PWD to this workdir
WORKDIR /app
RUN chown rails /app
USER rails

RUN gem install bundler

# Ensure binding is always 0.0.0.0, even in development, to access server from outside container
ENV BINDING="0.0.0.0"
ENV EDITOR="vi"
