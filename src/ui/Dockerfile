FROM ruby:2.2-alpine
ENV POST_SERVICE_HOST=post \
  POST_SERVICE_PORT=5000 \
  COMMENT_SERVICE_HOST=comment \
  COMMENT_SERVICE_PORT=9292 \
  APP_HOME=/app
RUN apk update && apk add build-base
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME
CMD ["puma"]
