FROM ubuntu:16.04

EXPOSE 9292

RUN apt-get update && apt-get install -y --no-install-recommends \
  mongodb-server=1:2.6.10-0ubuntu1 \
  ruby-full=1:2.3.0+1 \
  ruby-dev=1:2.3.0+1 \
  build-essential=12.1ubuntu2 \
  git-core=1:2.7.4-0ubuntu1.6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler
RUN git clone -b monolith https://github.com/express42/reddit.git
WORKDIR /reddit
RUN bundle install

COPY mongod.conf /etc/mongod.conf
COPY db_config start.sh ./
CMD ["./start.sh"]
