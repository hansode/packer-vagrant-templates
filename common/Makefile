SHELL=/bin/bash
NAME=`basename \`pwd\``
PROVIDER=virtualbox

all:

build:
	time packer build -only=$(PROVIDER)-iso template.json

test: add up ssh-test clean

clean: remove destroy

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
