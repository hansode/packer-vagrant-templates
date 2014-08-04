SHELL=/bin/bash
NAME=`basename \`pwd\``
PROVIDER=virtualbox

all: build

build: $(NAME).$(PROVIDER).box

$(NAME).$(PROVIDER).box: build-stamp

build-stamp: template.json ks.cfg
	time packer build -only=$(PROVIDER)-iso template.json
	touch $@

test: test-stamp
test-stamp: add up ssh-test remove destroy
	touch $@

clean:
	rm -f build-stamp
	rm -f test-stamp
	rm -f $(NAME).$(PROVIDER).box

add:
	time vagrant box add $(NAME) $(NAME).$(PROVIDER).box

remove:
	time vagrant box remove -f $(NAME) --provider $(PROVIDER)

up:
	time vagrant up --provider $(PROVIDER)

destroy:
	time vagrant destroy -f

ssh-test:
	time vagrant ssh -c hostname

.PHONY: build test clean add remove up destroy ssh-test
