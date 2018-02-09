FROM shaneburkhart/personal_tracker
MAINTAINER Shane Burkhart <shaneburkhart@gmail.com>

ENV RAILS_ENV development

RUN bundle install --with development test

# Mailcatcher port
EXPOSE 1025

CMD ["bundle", "exec", "rails", "s"]
