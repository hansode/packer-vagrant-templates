SHELL=/bin/bash
NAME=centos-6.0-i386
PROVIDER=virtualbox

all:

build:
	time packer build -only=$(PROVIDER)-iso template.json

add:
	time vagrant box add $(NAME) $(NAME).$(PROVIDER).box

remove:
	time vagrant box remove $(NAME) --provider $(PROVIDER)
