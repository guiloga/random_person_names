#####################
### Compile Image ###
#####################
FROM python:3.9-alpine3.13 as compile-image

# Metadata
LABEL maintainer="Guillem López Garcia (wyl.loga@gmail.com)"
LABEL version="0.1"
LABEL description="Base Image to build and run Scalade Function"

RUN apk update && \
    apk add make git tar

ENV SOURCE_DIR=/root/function-src
WORKDIR $SOURCE_DIR

COPY src/ $SOURCE_DIR/src
COPY requirements.txt $SOURCE_DIR
COPY Makefile $SOURCE_DIR

RUN make build

#################
### Run Image ###
#################
FROM python:3.9-alpine3.13 as run-image

ENV DIST_DIR=/root/function-dist
ENV PYTHONPATH=$PYTHONPATH:$DIST_DIR
WORKDIR $DIST_DIR

COPY --from=compile-image /opt/dist/function.tar.gz /tmp/

RUN apk add tar
RUN tar xvzf /tmp/function.tar.gz -C $DIST_DIR

# CMD ["scalade", "run"]
CMD ["/bin/sh", "-c", "python -u function.py"]
