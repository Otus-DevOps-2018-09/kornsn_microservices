FROM ruby:2.2-alpine
ENV COMMENT_DATABASE_HOST=comment_db \
  COMMENT_DATABASE=comments \
  APP_HOME=/app
RUN apk update && apk add build-base
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME
CMD ["puma"]
