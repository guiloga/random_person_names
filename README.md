# Scalade Function: Random Person Names
**edited at July 1, 2021**

### Scalade function fixture example

____
[![Build Status](https://www.travis-ci.com/guiloga/guilogacore-rpc.svg?branch=master)](https://www.travis-ci.com/guiloga/guilogacore-rpc)

This is a [**SCALADE**](https://scalade.io) fixture function called **random_person_names** that serves as base creation example.

## Prerequisites ###

* Scaladecore >= [**0.1**](https://www.python.org/downloads/release/python-380/)
* Python >= [**3.6**](https://www.python.org/downloads/release/python-380/)
## Documentation ###

Documentation for the package is not available yet.

## Development

### Installation
```
python3.9 -m virtualenv ~/.virtualenvs/random_person_names
source ~/.virtualenvs/random_person_names/bin/activate
```

## Build to distribution
```sh
# Docker Build Image
docker build -t guiloga/random_person_names:1.0 .
```

```sh
# Build the distribution package running a docker container
docker run -it --volume=$(pwd)/:/opt python:3.9-alpine3.13 /bin/sh
apk update && apk add make tar
make build
```

## Authors

* **Guillem López Garcia** - [guiloga](https://github.com/guiloga)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
