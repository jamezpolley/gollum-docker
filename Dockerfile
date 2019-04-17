FROM ruby
RUN apt-get -y update && \
    apt-get -y install libicu-dev cmake python2.7 python-pip && \
    rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist && \
    gem install gollum && \
    gem install org-ruby && \
    gem install asciidoctor && \
    gem install creole && \
    gem install wikicloth && \
    gem install RedCloth && \
    pip install --upgrade pip docutils
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "80"]
EXPOSE 80
