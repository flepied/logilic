Logilic
+++++++

Logilic is a solution to deal with the complexity of the software
licenses when mixing multiple types of licenses. For example when you
have to mix proprietary and copyleft licenses. It helps you cope with
your duties when you deliver your software in binary form to your
customer.

Logilic is organized in 3 parts:

- rules to reason about licenses in ``predicates.pl``. You should not
  modify them.

- facts about licenses and their consequences in ``licenses.pl``. Should
  be handled in cooperation with your legal department.

- project specific facts like how libraries are linked (statically or
  dynamically) with your executables and the versions of the
  components. Should be handled by the technical team or
  auto-generated during your build process. There are examples of such
  decriptions in ``project1.pl`` and ``project2.pl``.

Usage
=====

Projects must declare their components using the ``library``,
``executable``, ``dynamiclink``, ``staticlink``, ``testtool`` and
``buildtool`` predicates.

Once project facts are loaded like this using GNU Prolog::
 
 $ ./logilic project1.pl

Or a binary has been generated like this using GNU Prolog or SWI
Prolog and launched::

 $ ./logilic_compile project1.pl
 $ ./logilic_project1

you can use the query language like this::
 
 | ?- invalid_components(L).
 
 L = []
 
 (1 ms) yes

This should return an empty list to be sure that all components have
a known license.

To return the list of components that need actions on delivery to the
customer::

 | ?- duties(L).
 
 L = [(xbmc,provide_sourcecode),(openssl,mention_in_doc),(qt,provide_sourcecode)]
 
 yes

If you do the same thing but loading project2.pl instead of
project1.pl which differs only by linking statically prog1 with
Qt. You'll have this result::
 
 | ?- duties(L).
 
 L = [(xbmc,provide_sourcecode),(openssl,mention_in_doc),(qt,provide_sourcecode),(prog1,provide_sourcecode)]
 
 yes

You'll have to provide the source code of prog1 as a result...

To check that the licenses of the various dependencies on an
executable are compatible::
 
 | ?- licenses('xbmc', L), compatible_licenses(L).
 
 L = [gpl_license]
 
 yes

Examples have been tested with GNU Prolog 1.4.1 and SWI Prolog 6.0.2.
