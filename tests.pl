%% -*- prolog -*-
%%---------------------------------------------------------------
%% Project         : logilic
%% File            : tests.pl
%% Copyright       : (C) 2012 by 
%% Author          : Frederic Lepied
%% Created On      : Sun Dec  2 15:00:59 2012
%% Purpose         : test to validate logilic engine
%%---------------------------------------------------------------

:- begin_tests(predicates).
:- consult('predicates.pl').
:- consult('licenses.pl').
:- consult('project1.pl').

test(duties) :-
    duties(L),
    assertion(L == [(xbmc,provide_sourcecode), (openssl,mention_in_doc), (qt,provide_sourcecode)]).

test(invalid_components) :-
    invalid_components(L),
    assertion(L == []).

test(licenses) :-
    licenses('xbmc', L), compatible_licenses(L),
    assertion(L == [gpl_license]).

test(licenses, fail) :-
    licenses('prog1', L), compatible_licenses(L).

:- end_tests(predicates).

%% tests.pl ends here
