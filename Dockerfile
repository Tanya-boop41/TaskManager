FROM ruby:2.7.7-bullseye

ARG RAILS_ROOT=/task_manager

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    git \
    curl \
    vim \
    less \
    tzdata \
    bash \
    sudo \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && npm install -g yarn \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler:2.3.22

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle config set path '/usr/local/bundle' \
 && bundle config unset without \
 && bundle lock --add-platform ruby \
 && bundle lock --add-platform arm64-darwin \
 && bundle install --jobs 5 --retry 3

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . $RAILS_ROOT

ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
