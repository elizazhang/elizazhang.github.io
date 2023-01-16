FROM jekyll/jekyll:4.0

COPY Gemfile* ./

RUN gem install bundler:2.3.25 && bundle install

ENTRYPOINT [ "jekyll" ]

CMD [ "build" ]
