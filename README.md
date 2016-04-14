Packer Vagrant Templates
========================

This repository contains templates for CentOS/Fedora that can create Vagrant base boxes using Packer.

Current Boxes
-------------

64-bit boxes:

+ [deepakprabhakara/centos-7](https://vagrantcloud.com/deepakprabhakara/centos-7)
+ [hansode/centos-7.1.1503-x86_64](https://vagrantcloud.com/hansode/centos-7.1.1503-x86_64)
+ [hansode/centos-7.0.1406-x86_64](https://vagrantcloud.com/hansode/centos-7.0.1406-x86_64)
+ [hansode/centos-6.6-x86_64](https://vagrantcloud.com/hansode/centos-6.6-x86_64)
+ [hansode/centos-6.5-x86_64](https://vagrantcloud.com/hansode/centos-6.5-x86_64)
+ [hansode/centos-6.4-x86_64](https://vagrantcloud.com/hansode/centos-6.4-x86_64)
+ [hansode/centos-6.3-x86_64](https://vagrantcloud.com/hansode/centos-6.3-x86_64)
+ [hansode/centos-6.2-x86_64](https://vagrantcloud.com/hansode/centos-6.2-x86_64)
+ [hansode/centos-6.1-x86_64](https://vagrantcloud.com/hansode/centos-6.1-x86_64)
+ [hansode/centos-6.0-x86_64](https://vagrantcloud.com/hansode/centos-6.0-x86_64)
+ [hansode/centos-5.11-x86_64](https://vagrantcloud.com/hansode/centos-5.11-x86_64)
+ [hansode/centos-5.10-x86_64](https://vagrantcloud.com/hansode/centos-5.10-x86_64)
+ [hansode/centos-5.9-x86_64](https://vagrantcloud.com/hansode/centos-5.9-x86_64)
+ [hansode/centos-5.8-x86_64](https://vagrantcloud.com/hansode/centos-5.8-x86_64)
+ [hansode/centos-5.7-x86_64](https://vagrantcloud.com/hansode/centos-5.7-x86_64)
+ [hansode/centos-5.6-x86_64](https://vagrantcloud.com/hansode/centos-5.6-x86_64)
+ [hansode/centos-5.5-x86_64](https://vagrantcloud.com/hansode/centos-5.5-x86_64)
+ [hansode/centos-5.4-x86_64](https://vagrantcloud.com/hansode/centos-5.4-x86_64)
+ [hansode/centos-5.3-x86_64](https://vagrantcloud.com/hansode/centos-5.3-x86_64)
+ [hansode/centos-5.2-x86_64](https://vagrantcloud.com/hansode/centos-5.2-x86_64)
+ [hansode/fedora-22-server-x86_64](https://vagrantcloud.com/hansode/boxes/fedora-22-server-x86_64)
+ [hansode/fedora-21-server-x86_64](https://vagrantcloud.com/hansode/boxes/fedora-21-server-x86_64)
+ [hansode/fedora-20-x86_64](https://vagrantcloud.com/hansode/boxes/fedora-20-x86_64)

32-bit boxes:

+ [hansode/centos-6.6-i386](https://vagrantcloud.com/hansode/centos-6.6-i386)
+ [hansode/centos-6.5-i386](https://vagrantcloud.com/hansode/centos-6.5-i386)
+ [hansode/centos-6.4-i386](https://vagrantcloud.com/hansode/centos-6.4-i386)
+ [hansode/centos-6.3-i386](https://vagrantcloud.com/hansode/centos-6.3-i386)
+ [hansode/centos-6.2-i386](https://vagrantcloud.com/hansode/centos-6.2-i386)
+ [hansode/centos-6.1-i386](https://vagrantcloud.com/hansode/centos-6.1-i386)
+ [hansode/centos-6.0-i386](https://vagrantcloud.com/hansode/centos-6.0-i386)
+ [hansode/centos-5.11-i386](https://vagrantcloud.com/hansode/centos-5.11-i386)
+ [hansode/centos-5.10-i386](https://vagrantcloud.com/hansode/centos-5.10-i386)
+ [hansode/centos-5.9-i386](https://vagrantcloud.com/hansode/centos-5.9-i386)
+ [hansode/centos-5.8-i386](https://vagrantcloud.com/hansode/centos-5.8-i386)
+ [hansode/centos-5.7-i386](https://vagrantcloud.com/hansode/centos-5.7-i386)
+ [hansode/centos-5.6-i386](https://vagrantcloud.com/hansode/centos-5.6-i386)
+ [hansode/centos-5.5-i386](https://vagrantcloud.com/hansode/centos-5.5-i386)
+ [hansode/centos-5.4-i386](https://vagrantcloud.com/hansode/centos-5.4-i386)
+ [hansode/centos-5.3-i386](https://vagrantcloud.com/hansode/centos-5.3-i386)
+ [hansode/centos-5.2-i386](https://vagrantcloud.com/hansode/centos-5.2-i386)
+ [hansode/fedora-22-server-i386](https://vagrantcloud.com/hansode/boxes/fedora-22-server-i386)
+ [hansode/fedora-21-server-i386](https://vagrantcloud.com/hansode/boxes/fedora-21-server-i386)
+ [hansode/fedora-20-i386](https://vagrantcloud.com/hansode/boxes/fedora-20-i386)

Installed Packages
------------------

Minimal + Guest Additions + Debugging/Development tools

+ openssh
+ openssh-clients
+ openssh-server
+ rpm
+ yum
+ curl
+ dhclient
+ passwd
+ vim-minimal
+ sudo
+ kernel-devel
+ gcc
+ perl
+ bzip2
+ ntp
+ ntpdate
+ man
+ rsync
+ git
+ make
+ vim-minimal
+ screen
+ nmap
+ lsof
+ strace
+ tcpdump
+ traceroute
+ telnet
+ ltrace
+ bind-utils
+ sysstat
+ nc
+ wireshark
+ zip
+ nfs-utils
+ acpid

Requirements
------------

* Packer (>= 0.7.5)(http://www.packer.io/downloads.html)
* Vagrant (>= 1.7.1)(http://www.vagrantup.com/downloads.html)
* Platforms
  * Virtualbox (>= 4.3.26)(https://www.virtualbox.org/wiki/Downloads)
  * VMware Workstaion (>= 10)(https://www.vmware.com/go/downloadworkstation)
* Vagrant VMware plugin if you're using vmware (http://www.vagrantup.com/vmware)

Build Vagrant Base Box
----------------------

A GNU Make `Makefile` drives the process via the following targets:

```
$ make build # Build the box
$ make test  # Run tests
$ make clean # Clean up stamp files
```

### Makefile variable(s)

The variable(s) can be currently used are:

+ PROVIDER

Possible values for the PROVIDER are:

+ virtualbox (default)
+ vmware

If you build the vagrant base box for vmware, the value of `PROVIDER` should be `vmware`. For example with vmware:

```
$ make build PROVIDER=vmware
$ make test  PROVIDER=vmware
```

### Folder Structure

```
project/
|  +- Makefile      # Symbolic link of ../common/Makefile
|  +- ks.cfg        # Minimal base box build scenario
|  +- template.json # Packer template
|  +- Vagrantfile   # Copy of ../templates/Vagrantfile
|
+- common/
|  +- Makefile
|  +- scripts/
|     +- setup.sh
|     +--- bootstrap.sh
|     +--- sshd_config.sh
|     +--- vagrant.guest.account.sh
|     +--- virtualbox.guest.additions.sh
|     +--- vmware-tools.sh
|     +- teardown.sh
|
+- templates/
   +- Vagrantfile
   +- ks.5.cfg # Kickstart config for CentOS-5.x
   +- ks.6.cfg # Kickstart config for CentOS-6.x
   +- ks.7.cfg # Kickstart config for CentOS-7.x
```

Contribution
------------

1. Fork ([https://github.com/hansode/packer-vagrant-templates](https://github.com/hansode/packer-vagrant-templates)).
2. Create a feature branch.
3. Commit your changes.
4. Fix stuff.  Use `make build` in a relevant directory (like `cd centos-6.5-x86_64`).
5. Run `make test` in a relevant directory (like `cd centos-6.5-x86_64`) to see if the tests pass.  Repeat steps 3-5 until done.
6. Update `README.md` and `AUTHORS` to reflect any changes.
7. Push to your fork and submit a pull request.

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
