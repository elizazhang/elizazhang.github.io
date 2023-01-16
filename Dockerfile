FROM jekyll/jekyll:3.8

COPY Gemfile* ./

RUN gem install bundler:2.3.25 && bundle install

ENTRYPOINT [ "jekyll" ]

CMD [ "build" ]
