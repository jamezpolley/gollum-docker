FROM ruby
RUN apt-get -y update && \
    apt-get -y install libidn11-dev libicu-dev cmake python2.7 python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip docutils && \
    gem update
COPY Gemfile .
RUN gem install -g Gemfile && \
    pip install --upgrade pip docutils
WORKDIR /wiki
CMD ["gollum", "--port", "4567", "--allow-uploads", "dir", "--mathjax", "--show-all"]
EXPOSE 4567
