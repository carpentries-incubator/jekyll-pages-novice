FROM jekyll/jekyll

RUN apk --no-cache add \
    py3-yaml \
 && gem install json kramdown
