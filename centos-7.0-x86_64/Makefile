SHELL=/bin/bash
NAME=centos-7.0.1406-x86_64
PROVIDER=virtualbox

all:

build:
	time packer build template.json

add:
	time vagrant box add $(NAME) $(NAME).$(PROVIDER).box

remove:
	time vagrant box remove $(NAME) --provider $(PROVIDER)
