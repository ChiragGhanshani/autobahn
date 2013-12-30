#!/bin/bash

if [ $USER != "vagrant" ]; then
	echo "Must run in Vagrant VM"
	exit 1
fi

if ! which perlbrew > /dev/null 2>&1; then
	wget -O - http://install.perlbrew.pl | bash
fi
source ~/perl5/perlbrew/etc/bashrc
perlbrew install -v perl-5.14.4
if ! which cpanm > /dev/null 2>&1; then
	perlbrew install-cpanm
fi
cpanm --installdeps .

echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc