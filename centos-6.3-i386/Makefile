SHELL=/bin/bash
NAME=`basename \`pwd\``
PROVIDER=virtualbox

all:

build:
	time packer build -only=$(PROVIDER)-iso template.json

add:
	time vagrant box add $(NAME) $(NAME).$(PROVIDER).box

remove:
	time vagrant box remove $(NAME) --provider $(PROVIDER)
