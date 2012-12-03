#---------------------------------------------------------------
# Project         : logilic
# File            : Makefile
# Copyright       : (C) 2012 Frederic Lepied
# Author          : Frederic Lepied
# Created On      : Thu Nov 22 20:41:20 2012
# Purpose         : build rules
#---------------------------------------------------------------
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#---------------------------------------------------------------

VERSION=0.1

SRC = licenses.pl predicates.pl
OTHER = README.rst COPYING project1.pl logilic logilic_compile Makefile

all: logilic_project1 logilic_project2

logilic_project1: project1.pl $(SRC)
	./logilic_compile project1.pl

logilic_project2: project2.pl $(SRC)
	./logilic_compile project2.pl

project2.pl: project1.pl
	sed -e 's/dynamiclink(prog1, qt)./staticlink(prog1, qt)./' -e 's/project1/project2/' < project1.pl > project2.pl

tests:
	swipl -t run_tests -f tests.pl 2>&1 |tee result
	@fgrep -q passed result; r=$$?; rm -f result; test $$r = 0

dist:
	rm -rf logilic-$(VERSION)
	mkdir logilic-$(VERSION)
	ln $(OTHER) $(SRC) logilic-$(VERSION)/
	tar zcvf logilic-$(VERSION).tar.gz logilic-$(VERSION)
	rm -rf logilic-$(VERSION)

clean:
	rm -f *.o *~ logilic_project1 logilic_project2 project2.pl result

# Makefile ends here
