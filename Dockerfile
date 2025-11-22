FROM ruby:3.2.4-alpine

ARG RAILS_ROOT=/task_manager

RUN apk add --no-cache \
    build-base \
    linux-headers \
    postgresql-dev \
    tzdata \
    git \
    curl \
    bash \
    less \
    libc6-compat \
    nodejs \
    npm \
    yarn

RUN gem update --system && gem install bundler

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle config set path '/usr/local/bundle' \
 && bundle config unset without \
 && bundle lock --add-platform ruby \
 && bundle lock --add-platform aarch64-linux-musl \
 && bundle install --jobs 5 --retry 5

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . $RAILS_ROOT

ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
