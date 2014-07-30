Packer Vagrant Templates
========================

System Requirements
-------------------

+ [Packer](http://www.packer.io/)

Installation
------------

```
$ git clone https://github.com/hansode/packer-vagrant-templates.git
```

Getting Started
---------------

```
$ cd <project>
$ make build
```

Folder Structure
----------------

```
project/
|  +- Makefile      # symbolic link of ../common/Makefile
|  +- ks.cfg        # minimal base box build scenario
|  +- template.json # packer template
|  +- scripts       # symbolic link of ../common/scripts
|
+- common/
   +- Makefile
   +- scripts/
      +- setup.sh
      +--- bootstrap.sh
      +--- sshd_config.sh
      +--- vagrant.guest.account.sh
      +- teardown.sh
```

Vagrant Base Box Build Workflow
-------------------------------

```
$ make build
```

```
$ make test
```

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
