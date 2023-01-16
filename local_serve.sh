#!/usr/bin/env bash
# step1: give executable permission to local_service.sh ```chmod a+x local_serve.sh```
# step2: build Jekyll app  ```./local_serve.sh build```
# step3: start Jekyll server ```./local_serve.sh serve```


set -e

case $1 in
    'prod-build')
        echo "Building docker image of Jekyll"
        docker build -t jekyll .

        echo "Building Jekyll site"
        docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -e JEKYLL_ENV=prod \
            -t jekyll \
            build
    ;;
    'build')
        echo "Building docker image of Jekyll"
        docker build -t jekyll .

        echo "Building Jekyll site"
        docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -t jekyll
    ;;
    'serve')
    docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -p 4000:4000 \
            -it jekyll serve
    ;;
    # mapping the current directory to /srv/jekyll and running my jekyll container to build the site.
    # using the same directory to serve pages at port 4000 and using interactive mode to explicitly invoke serve command.
esac
