SHELL=/bin/sh
BUILD_DIR=/opt/build/
PYTHON=${BUILD_DIR}bin/python
DIST_DIR=/opt/dist/
DIST_PACKAGE=function.tar.gz

.PHONY = clean init package

.DEFAULT_GOAL = build

clean: # Cleans build and dist directories
	rm -rf ${BUILD_DIR}
	rm -rf ${DIST_DIR}

init: # Creates directories and installs packages
	mkdir ${BUILD_DIR}
	mkdir ${DIST_DIR}
	apk update && apk add rsync tar
	python -m pip install --upgrade pip
	python -m pip install virtualenv

package: # Creates a virtual environment and packages source code + installed packages 
	rsync -av --exclude '*__pycache__*' src/ ${BUILD_DIR}
	python -m virtualenv ${BUILD_DIR}
	${PYTHON} -m pip install --upgrade pip
	${PYTHON} -m pip install --upgrade -r ./requirements.txt --target=${BUILD_DIR}
	cd ${BUILD_DIR} && tar czvf ${DIST_DIR}${DIST_PACKAGE} . && cd -

build: clean init package
