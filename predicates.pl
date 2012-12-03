%% -*- prolog -*-
%%---------------------------------------------------------------
%% Project         : logilic
%% File            : predicates.pl
%% Copyright       : (C) 2012 Frederic Lepied
%% Author          : Frederic Lepied
%% Created On      : Thu Nov 22 20:41:20 2012
%% Purpose         : predicates to reason on licenses
%%---------------------------------------------------------------
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License along
%% with this program; if not, write to the Free Software Foundation, Inc.,
%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%---------------------------------------------------------------

%% dependencies for programs

dependency(Prog, _, Lic, Req, Prog) :-
    executable(Prog, Ver),
    license(Prog, Lic, Ver), requirement(Lic, Req).

%% dependencies for libraries

dependency(Prog, Lib, Lic, Req, Lib) :-
    executable(Prog, _), library(Lib, Ver),
    link(Prog, Lib),
    license(Lib, Lic, Ver), requirement(Lic, Req).

%% dependencies for (L)GPL contaminated programs

dependency(Prog, Lib, Lic, provide_sourcecode, Prog) :-
    executable(Prog, _),
    library(Lib, Ver),
    link(Prog, Lib),
    license(Lib, Lic, Ver), contaminate(Lic).

dependency(Prog, Lib, Lic, provide_sourcecode, Prog) :-
    executable(Prog, _), library(Lib, Ver),
    staticlink(Prog, Lib),
    license(Lib, Lic, Ver), staticlink_contaminate(Lic).

%% utilities

link(Prog, Lib) :-
    staticlink(Prog, Lib).

link(Prog, Lib) :-
    dynamiclink(Prog, Lib).

duty(Obj, Req) :-
    dependency(_, _, _, Req, Obj).

component(C, V) :-
    library(C, V).

component(C, V) :-
    executable(C, V).

component(C, V) :-
    testtool(C, V).

component(C, V) :-
    buildtool(C, V).

not(Goal) :-
    call(Goal),!,fail.

not(Goal).

%% entry points: predicates used to request duties and license infos

duties(L) :-
    findall((Y,Z), duty(Y, Z), L).

licenses(Prog, Lics) :-
    executable(Prog, ProgVer), license(Prog, ProgLic, ProgVer),
    findall(Lic, (link(Prog, Dep), library(Dep, Ver), license(Dep, Lic, Ver)), LibLics),
    append(LibLics, [ProgLic], Lics).

compatible_licenses(Lics) :-
    incompatible_licenses(Group1, Group2),
    member(Lic1, Group1),
    member(Lic1, Lics),
    member(Lic2, Group2),
    member(Lic2, Lics),
    !,
    fail.

compatible_licenses(Lics).

invalid_components(L) :-
    findall(C, (component(C, V), not(license(C, _, V))), L).

%% predicates.pl ends here
