SHELL=/bin/bash
PROVIDER=virtualbox

all: build

setup:
	(cd templates && make)

build: setup build-32 build-64

build-32:
	for i in centos-*-i386;   do echo ... $${i}; (cd $${i} && make build PROVIDER=$(PROVIDER)); done
build-64:
	for i in centos-*-x86_64; do echo ... $${i}; (cd $${i} && make build PROVIDER=$(PROVIDER)); done

test: test-32 test-64

test-32:
	for i in centos-*-i386;   do echo ... $${i}; (cd $${i} && make test PROVIDER=$(PROVIDER)); done
test-64:
	for i in centos-*-x86_64; do echo ... $${i}; (cd $${i} && make test PROVIDER=$(PROVIDER)); done

clean: clean-32 clean-64

clean-32:
	for i in centos-*-i386;   do echo ... $${i}; (cd $${i} && make clean PROVIDER=$(PROVIDER)); done
clean-64:
	for i in centos-*-x86_64; do echo ... $${i}; (cd $${i} && make clean PROVIDER=$(PROVIDER)); done
